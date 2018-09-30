import UIKit

/*
 问题是有一组数R，需要输出它的全排列。R的递归可定义如下：
 当个数n为1时，Perm(R) = (r)，其中r是集合R中唯一的元素
 当个数n大于1时，Perm(R)由(r1)Perm(R1),(r2)Perm(R2),(r3)Perm(R3),…,(rn)Perm(Rn)构成
 其中Ri = R - {ri} 即该集合中减去对应元素
 */

/*
 其实说直白点，就是递归地把这组数规模一个一个地缩小，如1,2,3,4. 先把1固定，递归地求2,3,4的全排列，又把2固定，递归地求3,4的全排列……直到只剩一个数，输出这个排列。
 当获取递归数组时，从该组数的第一个，依次和每一位交换（包括本身），得以产生一个新递归数组（如1,2,3,4，先是1和1交换，产生新的2,3,4）
 当1和1交换产生的所有递归完成之后，实际上已经完成了1234，1243，1324，1342，1432，1423的输出，因为1和自己交换之后，产生了2,3,4
 在这个过程中，当１,２,３固定时，只有４剩余，所以输出１,２,３,４.然后固定１,２，交换３,４的位置。输出１,２,４,３.此时１,２固定的已经全部输出，于是返回到只有１固定，那么此时２需要与３交换位置，再进行1,3固定的递归
 */

// 数组全排列
func permArray(array: inout [String], start: Int, total: Int) {
    if start == total {
        for i in 0...total {
            print(array[i], terminator: "")
        }
        print("\n")
    } else {
        for otherNum in start...total {
            // 从固定的数后第一个依次交换
            swapItem(array: &array, first: start, last: otherNum)
            // 递归排列后面的位数
            permArray(array: &array, start: start+1, total: total)
            // 这组递归完成之后需要交换回来
            swapItem(array: &array, first: start, last: otherNum)
        }
    }
}

func swapItem(array: inout [String], first: Int, last: Int) {
    let item = array[first]
    array[first] = array[last]
    array[last] = item
}

//let str = "a,b,c"
//var strArray = str.components(separatedBy: ",")
var strArray = ["a", "b", "c"]

permArray(array: &strArray, start: 0, total: 2)





