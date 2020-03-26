package card

import (
	"fmt"
	"math/rand"
)

type Poker struct {
	PokerType   int
	PokerValues map[int][]int
	TempList    map[int][]int
}

const (
	SPADE = iota
	HEARTS
	CLUBS
	DIAMONDS
	KING
)

func NewPoker() *Poker {
	return &Poker{PokerValues: make(map[int][]int), TempList: make(map[int][]int)}
}

func CreatePoker() *Poker {
	card := NewPoker()
	for i := 0; i < 52; i++ {
		if i != 0 && i%13 == 0 {
			card.PokerType++
		}
		card.PokerValues[card.PokerType+1] = append(card.PokerValues[card.PokerType+1], i%13+1)
	}
	card.PokerValues[KING] = append(card.PokerValues[KING], 1, 2)
	return card

}

func (c *Poker) Shuffle() *Poker {
	c.TempList = c.PokerValues
	for k, v := range c.TempList {
		cardIndex := rand.Intn(len(v))
		for p := range v {
			if cardIndex != 0 {
				c.TempList[k][v[p]+1], c.TempList[k][v[p]] = c.TempList[k][v[p]], c.TempList[k][v[p]+1]
			}
		}

	}
	return c
}
func (c *Poker) Print() {
	for k, v := range c.TempList {
		switch k {
		case SPADE:
			fmt.Printf("SPADE%v: %v", k, v)
		case HEARTS:
			fmt.Printf("HEARTS%v: %v", k, v)
		case CLUBS:
			fmt.Printf("CLUBS%v: %v", k, v)
		case DIAMONDS:
			fmt.Printf("DIAMONDS%v: %v", k, v)
		case KING:
			fmt.Printf("KING%v: %v", k, v)
		}
	}
	fmt.Println(c.PokerValues)
}

func Start() {
	card := CreatePoker()

	card.Print()
	card.Shuffle()
}

func main() {

}
