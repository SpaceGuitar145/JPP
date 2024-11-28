use async_std::sync::{Arc, Mutex};
use async_std::task;
use async_std::task::sleep;
use std::sync::Barrier;
use std::time::Duration;
use std::io;

struct Philosopher {
    id: usize,
    left_fork: Arc<Mutex<()>>,
    right_fork: Arc<Mutex<()>>,
    meals: usize,
    barrier: Arc<Barrier>,
}

impl Philosopher {
    fn new(id: usize, left_fork: Arc<Mutex<()>>, right_fork: Arc<Mutex<()>>, meals: usize, barrier: Arc<Barrier>) -> Self {
        Self { id, left_fork, right_fork, meals, barrier }
    }

    async fn dine(&self) {
        for i in 0..self.meals {
            println!("Philosopher {} is thinking.", self.id);
            sleep(Duration::from_secs(2)).await;

            println!("Philosopher {} is hungry.", self.id);

            let _left = self.left_fork.lock().await;
            let _right = self.right_fork.lock().await;

            println!("Philosopher {} is eating.", self.id);
            sleep(Duration::from_secs(2)).await;

            println!("Philosopher {} has finished meal {}.", self.id, i + 1);
        }

        println!("Philosopher {} has finished all meals and left the table.", self.id);
        self.barrier.wait();
    }
}

fn main() {
    let mut input = String::new();

    println!("Enter number of philosophers: ");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let num_philosophers: usize = input.trim().parse().expect("Please enter a number");

    input.clear();
    println!("Enter number of meals (default is 3): ");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let num_meals: usize = input.trim().parse().unwrap_or(3);

    let barrier = Arc::new(Barrier::new(num_philosophers + 1));
    let forks: Vec<_> = (0..num_philosophers).map(|_| Arc::new(Mutex::new(()))).collect();
    let mut philosophers = vec![];

    for i in 0..num_philosophers {
        let left_fork = Arc::clone(&forks[i]);
        let right_fork = Arc::clone(&forks[(i + 1) % num_philosophers]);
        philosophers.push(Philosopher::new(i + 1, left_fork, right_fork, num_meals, Arc::clone(&barrier)));
    }

    let mut handles = vec![];
    for philosopher in philosophers {
        let handle = task::spawn(async move {
            philosopher.dine().await;
        });
        handles.push(handle);
    }

    barrier.wait();
    println!("All philosophers have finished their meals.");

    for handle in handles {
        task::block_on(handle);
    }
}
