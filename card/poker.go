package card

import (
	"fmt"
	"math/rand"
	"sort"
	"strconv"

	"time"
)

//
//一、斗地主牌面分析
//斗地主需要多少张牌？大部分人都知道需要一副完整的牌即可，也就是54张牌。
//
//2-10 黑桃、红桃、梅花、方片各4张。
//J、Q、K、A 黑桃、红桃、梅花、方片各4张。
//大小王各1张。
//在斗地主中，牌的花色不影响。所以，在牌面比对时，不需要单独比对花色。而单张牌面值的大小顺序为: 大王>小王>2>A>K>Q>J>10……3
//鉴于此，牌面的表达可以用以下方式来规定：
//A：黑桃 B：红桃 C：梅花 D：方片
//
//扑克原始值	映射值
//3-10	3-10数字
//J	11
//Q	12
//K	13
//A	14
//2	15
//小王	Q88
//大王	K99
//例如：
//A14----->黑桃A
//C9----->梅花9
//二、如何开始游戏
//先来看一张图

//
//斗地主初始化.png
//游戏初始化拆分成3大块
//
//构造一副牌
//洗牌
//发牌
//1、构造一副牌
//构造一副牌就是根据牌面分析中规定的牌面表达方法构造一副完整的54张扑克牌。
//代码如下:

func CreateNew() []string {
	numbers := make([]string, 54) //构造一个大小为54的数组
	start := 0                    //造牌游标
	for i := 3; i <= 16; i++ {
		if i == 16 { //i为16说明已经到大小王
			numbers[start] = "Q88"
			numbers[start+1] = "K99" //直接构造大小王
		} else {
			numbers[start] = "A" + strconv.Itoa(i)
			numbers[start+1] = "B" + strconv.Itoa(i)
			numbers[start+2] = "C" + strconv.Itoa(i)
			numbers[start+3] = "D" + strconv.Itoa(i)
			start += 4 //每造一套单值牌，游标移4位
		}
	}
	return numbers
}

//2、洗牌
//洗牌就是将牌原有的顺序打乱，形成新的顺序的牌。主要利用随机数来处理。
func Shuffle(vals []string) {
	r := rand.New(rand.NewSource(time.Now().Unix())) //根据系统时间戳初始化Random
	for len(vals) > 0 { //根据牌面数组长度遍历
		n := len(vals)                                          //数组长度
		randIndex := r.Intn(n)                                  //得到随机index
		vals[n-1], vals[randIndex] = vals[randIndex], vals[n-1] //最后一张牌和第randIndex张牌互换
		vals = vals[:n-1]
	}
}

//
//3、发牌
//发牌可以说是斗地主开始前的最后一个环节(不包含叫地主抢地主)，发牌是要将牌先均分给3个玩家(保留3张底牌)，并从玩家中随机抽取一位玩家为地主。
//首先，将牌分成4部分:
//玩家一：17张牌
//玩家二：17张牌
//玩家三：17张牌
//底牌：3张

/**
*发牌
*order==0 玩家1次序
*order==1 玩家2次序
*order==2 玩家3次序
*order==3 底牌次序
 */
func Dispacther1(order int, vals []string) []string {
	var playCards []string
	if order < 0 || order > 3 { //判断玩家次序是否正确
		return []string{}
	} else {
		var size = 17 //默认总长度为17
		if order == 3 {
			size = 3 //次序为3(底牌次序)时，总长度为3
		}
		for i := 0; i < len(playCards); i++ {
			playCards = append(playCards, vals[order*size+i]) //根据次序发牌
		}
	}
	return playCards
}
func Dispacther(order int, vals []string) []string {
	var playCards []string
	if order < 0 || order > 3 { //判断玩家次序是否正确
		return []string{}
	} else {
		var size = 17 //默认总长度为17
		if order == 3 {
			size = 3 //次序为3(底牌次序)时，总长度为3
		}
		for i := 0; i < size; i++ {
			playCards = append(playCards, vals[order*size+i]) //根据次序发牌
		}
	}
	return playCards
}

//三、出牌分析
//接下来，就是最复杂的点，出牌的处理。
//
//1. 牌面分类
//首先要处理的是根据所出的牌，判断出出牌的类型。
//根据以往游戏中的经验来看，出牌类型总的可以分为以下几种类型(由简单到复杂)
//
//单根
//对子
//三不带
//三带一
//炸弹（4张同值牌）
//四带二
//飞机
//三不带飞机
//连对
//顺子
//王炸
//那么，根据以上类型，我们首先定义出出牌类型枚举

type CardTypeStatus int

const (
	_CardTypeStatus = iota
	SINGLE           //单根
	DOUBLE           //对子
	THREE            //三不带
	THREE_AND_ONE    //三带一
	BOMB             //炸弹
	FOUR_TWO         //四带二
	PLANE            //飞机
	PLANE_EMPTY      //三不带飞机
	DOUBLE_ALONE     //连对
	SINGLE_ALONE     //顺子
	KING_BOMB        //王炸
	ERROR_TYPE       //非法类型

)

//2.计算推理
//玩家出的牌张数不固定，那么，如何有效的判断出玩家所出牌的类型呢。
//首先从最简单的，根据牌的张数可以判断出最简单的两种场景
//
//单根
//对子
//王炸
//func ParseCardsInSize(plays []string) CardTypeStatus {
//	var status CardTypeStatus
//	switch len(plays) {
//	case 1:
//		fmt.Println("单根")
//		status = SINGLE
//		break
//	case 2:
//		if plays[0] == "Q88" && plays[1] == "K99" {
//			fmt.Println("王炸")
//			status = KING_BOMB
//
//		} else {
//			fmt.Println("对子")
//			status = DOUBLE
//		}
//		break
//	}
//	return status
//}

//这是最简单的判定方法，接下来，张数越多，复杂度越高。
//第二个方法就是根据出牌中值相同的牌的张数来判定类型。
//这里首先要抽象出计算模型

type CardShow struct {
	ShowValue      []string            //牌面数组
	ShowTime int64
	CardMap        map[int]int         //牌面计算结果
	MaxCount       int                 //最大牌值
	MaxValues      []int               //最大牌值出现的次数
	CompareValue   int                 //用于比较大小的值
	CardTypeStatus CardTypeStatus //牌面类型
}

//
//牌面数组，表示出牌的所有牌值
//牌面计算结果，表示出每个牌值出现的次数
//最大牌值
//最大牌值出现的次数
//用于比较大小的值
//牌面类型
//3.确定计算方法:
//超过两张的计算方法
//
//根据同值牌出现的次数确定牌种类范围：
//同值牌出现的次数均为1次---->可能为顺子
//同值牌出现的次数均为2次---->可能为连对
//同值牌出现的次数均为3次---->可能为飞机或三带一(暂时不考虑三带二)
//同值牌出现的次数均为4次---->可能为炸弹或者四带二
//其中顺子、连对、飞机需都要鉴别牌值的连续性
//飞机需要额外鉴别非连续牌的张数是否可连续次数相等
//连对组数要大于或等于3组
//顺子张数要大于或等于5
//再根据计算方法填充计算模型

/**
* 根据牌面数量判断牌面类型
 */
func ParseCardsInSize(plays []string) CardShow {
	cardShow := CardShow{
		ShowValue: plays,
		ShowTime:  time.Now().Unix(),
	}
	switch len(plays) {
	case 1:
		cardShow.CardTypeStatus = SINGLE
		cardShow.CompareValue = GetCardValue(plays[0])
		cardShow.MaxCount = 1
		cardShow.MaxValues = []int{cardShow.CompareValue}
		fmt.Printf("根%d", GetCardValue(plays[0]))
		break
	case 2:
		if plays[0] == "Q88" && plays[1] == "K99" {
			cardShow.CardTypeStatus = KING_BOMB
			cardShow.CompareValue = GetCardValue(plays[0])
			cardShow.MaxCount = 2
			cardShow.MaxValues = []int{cardShow.CompareValue}
			fmt.Println("王炸")
		} else {
			ParseCardsType(plays, &cardShow)
		}
		break
	}
	if len(plays) > 2 {
		ParseCardsType(plays, &cardShow)
	} else {
		cardShow.CardTypeStatus = ERROR_TYPE
	}
	return cardShow
}

/**
* 获取牌面类型
 */
func ParseCardsType(cards []string, cardShow *CardShow) {
	mapCard, maxCount, maxValues := ComputerValueTimes(cards)
	cardShow.MaxCount = maxCount
	cardShow.MaxValues = maxValues
	cardShow.CardMap = mapCard
	cardShow.CompareValue = maxValues[len(maxValues)-1]
	switch maxCount {
	case 4:
		if maxCount == len(cards) {
			cardShow.CardTypeStatus = KING_BOMB
			fmt.Println("炸弹")
		} else if len(cards) == 6 {
			cardShow.CardTypeStatus = FOUR_TWO
			fmt.Println("四带二")
		} else {
			cardShow.CardTypeStatus = ERROR_TYPE
			fmt.Println("不合法出牌")
		}
		break
	case 3:
		alive := len(cards) - len(maxValues)*maxCount
		if len(maxValues) == alive {
			if len(maxValues) == 1 {
				cardShow.CardTypeStatus = THREE_AND_ONE
				fmt.Println("三带一")
			} else if len(maxValues) > 1 {
				if IsContinuity(mapCard, false) {
					cardShow.CardTypeStatus = PLANE
					fmt.Printf("飞机%d", len(maxValues))
				} else {
					cardShow.CardTypeStatus = ERROR_TYPE
					fmt.Println("非法飞机")
				}
			}
		} else if alive == 0 {
			if len(maxValues) > 1 {
				if IsContinuity(mapCard, false) {
					cardShow.CardTypeStatus = PLANE_EMPTY
					fmt.Printf("三不带飞机%d", len(maxValues))
				} else {
					cardShow.CardTypeStatus = ERROR_TYPE
					fmt.Println("非法三不带飞机")
				}

			} else {
				cardShow.CardTypeStatus = THREE
				fmt.Println("三不带")
			}
		} else {
			cardShow.CardTypeStatus = ERROR_TYPE
			fmt.Println("不合法飞机或三带一")
		}
		break
	case 2:
		if len(maxValues) == (len(cards) / 2) {
			if len(maxValues) > 1 {
				if IsContinuity(mapCard, false) && len(maxValues) > 2 {
					cardShow.CardTypeStatus = DOUBLE_ALONE
					fmt.Printf("%d连队", len(maxValues))
				} else {
					cardShow.CardTypeStatus = ERROR_TYPE
					fmt.Println("非法连对")
				}
			} else if len(maxValues) == 1 {
				cardShow.CardTypeStatus = DOUBLE
				fmt.Printf("对%d", GetCardValue(cards[0]))
			}
		} else {
			cardShow.CardTypeStatus = ERROR_TYPE
			fmt.Println("不合法出牌")
		}
		break
	case 1:
		if IsContinuity(mapCard, true) && len(cards) >= 5 {
			cardShow.CardTypeStatus = SINGLE_ALONE
			fmt.Printf("%d顺子", len(mapCard))
		} else {
			fmt.Println("非法顺子")
		}
		break
	}
}

/**
* 获取顺序的key值数组
 */
func GetOrderKeys(cardMap map[int]int, isSingle bool) []int {
	var keys []int
	for key, value := range cardMap {
		if (!isSingle && value > 1) || isSingle {
			keys = append(keys, key)
		}
	}
	sort.Ints(keys)
	return keys
}

/**
* 计算牌面值是否连续
 */
func IsContinuity(cardMap map[int]int, isSingle bool) bool {
	keys := GetOrderKeys(cardMap, isSingle)
	lastKey := 0
	for i := 0; i < len(keys); i++ {
		if (lastKey > 0 && (keys[i]-lastKey) != 1) || keys[i] == 15 {
			return false
		}
		lastKey = keys[i]
	}
	if lastKey > 0 {
		return true
	} else {
		return false
	}
}

/**
* 计算每张牌面出现的次数
* mapCard 标记结果
* MaxCount 出现最多的次数
* MaxValues 出现次数最多的所有值
 */
func ComputerValueTimes(cards []string) (mapCard map[int]int, MaxCount int, MaxValues []int) {
	newMap := make(map[int]int)
	if len(cards) == 0 {
		return newMap, 0, nil
	}
	for _, value := range cards {
		cardValue := GetCardValue(value)
		if newMap[cardValue] != 0 {
			newMap[cardValue]++
		} else {
			newMap[cardValue] = 1
		}
	}
	var allCount []int //所有的次数
	var maxCount int   //出现最多的次数
	for _, value := range newMap {
		allCount = append(allCount, value)
	}
	maxCount = allCount[0]
	for i := 0; i < len(allCount); i++ {
		if maxCount < allCount[i] {
			maxCount = allCount[i]
		}
	}
	var maxValue []int
	for key, value := range newMap {
		if value == maxCount {
			maxValue = append(maxValue, key)
		}
	}
	sort.Ints(maxValue)
	return newMap, maxCount, maxValue
}

/**
* 获取牌面值
 */
func GetCardValue(card string) int {
	//stringValue := util.Substring(card, 1, len(card))
	//value, err := strconv.Atoi(stringValue)
	//if err == nil {
	//	return value
	//}
	return -1
}

