package main

import (
	"log"
	"math/rand"
	"sync"
	"sync/atomic"
	"time"
)

func do(seconds int, action ...any) {
	log.Println(action...)
	randomMillis := 500*seconds + rand.Intn(500*seconds)
	time.Sleep(time.Duration(randomMillis) * time.Millisecond)
}

type Order struct {
	customer   string
	reply      chan *Order
	preparedBy string
	id         uint64
}

var nextId atomic.Uint64

func cook(name string, waiter chan *Order) {
	log.Println(name, "starting work")
	for {
		order, ok := <-waiter
		if !ok {
			log.Println(name, "finishing work")
			return
		}
		do(10, name, "cooking order", order.id, "for", order.customer)
		order.preparedBy = name
		order.reply <- order
	}
}

func customer(name string, waiter chan *Order, wg *sync.WaitGroup) {
	defer wg.Done()
	mealsEaten := 0
	for mealsEaten < 5 {
		order := &Order{
			id:       nextId.Add(1),
			customer: name,
			reply:    make(chan *Order, 1),
		}
		log.Println(name, "placed order", order.id)

		select {
		case waiter <- order:
			meal := <-order.reply
			do(2, name, "eating cooked order", meal.id, "prepared by", meal.preparedBy)
			mealsEaten++
		case <-time.After(7 * time.Second):
			do(5, name, "waiting too long, abandoning order", order.id)
		}
		close(order.reply)
	}
	log.Println(name, "going home")
}

func main() {

	customers := [...]string{"Ani", "Bai", "Cat", "Dao", "Eve", "Fay", "Gus", "Hua", "Iza", "Jai"}
	waiter := make(chan *Order, 3)
	var restaurant sync.WaitGroup

	cookNames := [3]string{"Remy", "Colette", "Linguini"}
	for _, name := range cookNames {
		go cook(name, waiter)
	}

	for _, name := range customers {
		restaurant.Add(1)
		go customer(name, waiter, &restaurant)
	}

	restaurant.Wait()
	close(waiter)
	log.Println("Restaurant closing")
}
