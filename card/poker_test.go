package card

import (
	"fmt"
	"testing"
)

//验证一下:
//打印：
//[A3 B3 C3 D3 A4 B4 C4 D4 A5 B5 C5 D5 A6 B6 C6 D6 A7 B7 C7 D7 A8 B8 C8 D8 A9 B9 C9 D9 A10 B10 C10 D10 A11 B11 C11 D11 A12 B12 C12 D12 A13 B13 C13 D13 A14 B14 C14 D14 A15 B15 C15 D15 Q88 K99]
//
func TestCreateNew(t *testing.T) {
	initValues := CreateNew()
	fmt.Println(initValues)
}

//这是一种抽牌插底的洗牌算法，时间复杂度为O(n)，当然还有效率更高的洗牌算法，具体可以另做研究。
//验证一下:
//
//打印：
//洗牌前:  [A3 B3 C3 D3 A4 B4 C4 D4 A5 B5 C5 D5 A6 B6 C6 D6 A7 B7 C7 D7 A8 B8 C8 D8 A9 B9 C9 D9 A10 B10 C10 D10 A11 B11 C11 D11 A12 B12 C12 D12 A13 B13 C13 D13 A14 B14 C14 D14 A15 B15 C15 D15 Q88 K99]
//洗牌后 [A4 D15 C12 D13 A10 D4 A9 Q88 A7 A6 D6 D14 D10 A14 B4 B15 C8 B13 C14 C13 B11 C4 A12 D11 A3 C5 C10 A13 B5 D8 B6 D9 B10 D7 A5 B7 B3 B14 B12 C3 B8 C7 C15 C6 D3 D5 A8 A15 C11 B9 K99 C9 D12 A11]
//可见洗牌达到了预期。
func TestShuffle(t *testing.T) {
	initValues := CreateNew()
	fmt.Println("洗牌前: ", initValues)
	Shuffle(initValues)
	fmt.Println("洗牌后", initValues)
}

//验证一下
//
//打印：
//玩家1： [A4 C14 B14 C4 C13 C15 D6 D14 A13 B13 D11 B4 B12 C12 B9 D8 B6]
//玩家2： [A9 D3 D10 A5 C5 C7 C8 A7 C6 A6 C11 B15 C9 A3 C10 A8 D13]
//玩家3： [K99 D15 C3 B3 B5 A15 A11 B7 Q88 A10 D12 A12 A14 D7 B11 B8 D9]
//底牌： [B10 D4 D5]
//从打印结果来看，发牌也是满足场景的。
func TestDispacther(t *testing.T) {
	initValues := CreateNew()
	Shuffle(initValues)
	play1:=Dispacther(0, initValues)
	fmt.Println("玩家1：", play1)
	fmt.Println("玩家2：", Dispacther(1, initValues))
	fmt.Println("玩家3：", Dispacther(2, initValues))
	fmt.Println("底牌：", Dispacther(3, initValues))
}

//验证飞机
func TestParseCardsInSize(t *testing.T) {
	// 1
	cardsA := []string{"A3", "B3", "C3", "A4", "B4", "C4", "A5", "B5", "A5", "A6", "B6", "A6", "A11", "A7", "B12", "B7"}
	ashowMode := ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)
	// 2
	cardsA = []string{"A3", "B3", "C3", "A4", "B4", "C4", "A5", "B5", "A5", "A6", "B6", "A6"}
	ashowMode = ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)
	//3
	cardsA = []string{"A3", "B3", "C3", "A4", "B4", "C4", "A5", "B5", "A5", "A6", "B6", "A6", "A11", "A7", "B12"}
	ashowMode = ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)
	//4
	cardsA = []string{"A3", "B3", "C3", "A4", "B4", "C4", "A5", "B5", "A5", "A6", "B6", "A6", "A11", "A7", "B12", "B7"}
	ashowMode = ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)

	// 5 比较
	cardsA = []string{"A3", "B3", "C3", "A4", "B4", "C4", "A5", "B5", "A5", "A6", "B6", "A6", "A11", "A7", "B12", "B7"}
	ashowMode = ParseCardsInSize(cardsA)
	cardsB := []string{"A4", "B4", "C4", "A5", "B5", "C5", "A6", "B6", "A6", "A7", "B7", "A7", "A11", "A10", "B12", "13"}
	bshowMode := ParseCardsInSize(cardsB)
	fmt.Println("\nA玩家:", ashowMode.CompareValue)
	fmt.Println("B玩家:", bshowMode.CompareValue)
}
//验证炸弹
func TestParseCardsInSize2(t *testing.T) {
	// 1
	cardsA := []string{"A3", "B3", "C3", "D3"}
	ashowMode := ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)
}
//验证顺子
func TestParseCardsInSize3(t *testing.T) {
	// 1
	cardsA := []string{"A3", "B4", "C5", "A6", "B7"}
	ashowMode := ParseCardsInSize(cardsA)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)

	// 顺子比对
	cardsA = []string{"A3", "B4", "C5", "A6"}
	cardsB := []string{"A3", "B4", "C5", "A8"}
	ashowMode = ParseCardsInSize(cardsA)
	bshowMode := ParseCardsInSize(cardsB)
	fmt.Println("\nA玩家:", ashowMode.CardTypeStatus)
	fmt.Println("\nB玩家:", bshowMode.CardTypeStatus)
}