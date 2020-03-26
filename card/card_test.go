package card

import "testing"

func TestCreateCard(t *testing.T) {
	card := CreatePoker()

	card.Print()
	t.Log()
}
