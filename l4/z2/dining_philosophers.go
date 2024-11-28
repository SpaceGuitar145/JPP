package main

import (
	"fmt"
	"sync"
	"time"
)

type Philosopher struct {
	id                  int
	leftFork, rightFork *Fork
	meals               int
	done                chan bool
}

type Fork struct {
	sync.Mutex
}

func (p *Philosopher) dine(wg *sync.WaitGroup) {
	defer wg.Done()

	for i := 0; i < p.meals; i++ {
		fmt.Printf("Philosopher %d is thinking.\n", p.id)
		time.Sleep(time.Second * 2)

		fmt.Printf("Philosopher %d is hungry.\n", p.id)
		p.leftFork.Lock()
		p.rightFork.Lock()

		fmt.Printf("Philosopher %d is eating.\n", p.id)
		time.Sleep(time.Second * 2)

		p.rightFork.Unlock()
		p.leftFork.Unlock()

		fmt.Printf("Philosopher %d has finished meal %d.\n", p.id, i+1)
	}

	fmt.Printf("Philosopher %d has finished all meals and left the table.\n", p.id)
	p.done <- true
}

func main() {
	var numPhilosophers, numMeals int

	fmt.Print("Enter number of philosophers: ")
	fmt.Scan(&numPhilosophers)

	fmt.Print("Enter number of meals (default is 3): ")
	n, err := fmt.Scan(&numMeals)
	if err != nil || n == 0 || numMeals <= 0 {
		numMeals = 3
		fmt.Println("Using default value of 3 meals.")
	}

	forks := make([]*Fork, numPhilosophers)
	for i := 0; i < numPhilosophers; i++ {
		forks[i] = &Fork{}
	}

	philosophers := make([]*Philosopher, numPhilosophers)
	done := make(chan bool, numPhilosophers)
	for i := 0; i < numPhilosophers; i++ {
		philosophers[i] = &Philosopher{
			id:        i + 1,
			leftFork:  forks[i],
			rightFork: forks[(i+1)%numPhilosophers],
			meals:     numMeals,
			done:      done,
		}
	}

	var wg sync.WaitGroup
	for _, p := range philosophers {
		wg.Add(1)
		go p.dine(&wg)
	}

	wg.Wait()

	fmt.Println("All philosophers have finished their meals.")
}
