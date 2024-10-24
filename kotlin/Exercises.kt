import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun change(amount: Long): Map<Int, Long> {
    require(amount >= 0) { "Amount cannot be negative" }
    
    val counts = mutableMapOf<Int, Long>()
    var remaining = amount
    for (denomination in listOf(25, 10, 5, 1)) {
        counts[denomination] = remaining / denomination
        remaining %= denomination
    }
    return counts
}

fun firstThenLowerCase(stringList: List<String>, filerFunction: (input: String) -> Boolean): String? {
    var outputString: String? = null
    var firstCaseFound = false
    for (string in stringList) {
        if (filerFunction(string) && !firstCaseFound) {
            outputString = string
            firstCaseFound = true
        }
    }

    return outputString?.lowercase()
}

class ChainableString(val phrase: String?) {
    fun and(stringSuffix: String): ChainableString {
        return ChainableString(phrase.plus(" ").plus(stringSuffix))
    }
}

fun say(string: String? = null): ChainableString {
    return ChainableString(string ?: "")
}

fun meaningfulLineCount(filePath: String): Long {
    var fileReader: FileReader

    try {
        fileReader = FileReader(filePath)
    } catch (e: Exception) {
        throw IOException("file")
    }

    val bufferedReader = BufferedReader(fileReader)
    val text: String = bufferedReader.use { reader ->
        reader.readText()
    }
    val lines = text.split("\n")

    var lineCount: Long = 0
    for (line in lines) {
        var firstChar = '#'
        var firstCharFound = false

        val chars = line.toCharArray()
        for (char in chars) {
            if (char != ' ' && char != '	' && char != ' ' && char.code != 13 && !firstCharFound) {
                firstChar = char
                firstCharFound = true
            }
        }

        if (firstChar != '#' && firstCharFound) {
            lineCount += 1
        }
    }
    return lineCount
}

class Quaternion(val a: Double, val b: Double, val c: Double, val d: Double) {
    companion object {
        val ZERO = Quaternion(0.0, 0.0, 0.0, 0.0)
        val I = Quaternion(0.0, 1.0, 0.0, 0.0)
        val J = Quaternion(0.0, 0.0, 1.0, 0.0)
        val K = Quaternion(0.0, 0.0, 0.0, 1.0)
    }

    operator fun times(a: Quaternion): Quaternion {
        return Quaternion((this.a * a.a) - (this.b * a.b) - (this.c * a.c) - (this.d * a.d),
                                       (this.a * a.b) + (this.b * a.a) + (this.c * a.d) - (this.d * a.c),
                                       (this.a * a.c) - (this.b * a.d) + (this.c * a.a) + (this.d * a.b),
                                       (this.a * a.d) + (this.b * a.c) - (this.c * a.b) + (this.d * a.a))
    }

    operator fun plus(a: Quaternion): Quaternion {
        return Quaternion(this.a + a.a, this.b + a.b, this.c + a.c, this.d + a.d)
    }

    override operator fun equals(a: Any?): Boolean {
        if (a is Quaternion) { return this.a == a.a && this.b == a.b && this.c == a.c && this.d == a.d } else { return false }
    }

    override fun toString(): String {
        var quatString = ""
        
        if (this.a != 0.0) { quatString = "${this.a}" }
        
        if (this.b == 1.0 && quatString.length == 0) { quatString = "${quatString}i" }
        else if (this.b == 1.0) { quatString = "${quatString}+i" }
        else if (this.b == -1.0) { quatString = "${quatString}-i" }
        else if (this.b > 0.0) { quatString = "${quatString}+${this.b}i" }
        else if (this.b < 0.0) { quatString = "${quatString}${this.b}i" }
        
        if (this.c == 1.0 && quatString.length == 0) { quatString = "${quatString}j" }
        else if (this.c == 1.0) { quatString = "${quatString}+j" }
        else if (this.c == -1.0) { quatString = "${quatString}-j" }
        else if (this.c > 0.0) { quatString = "${quatString}+${this.c}j" }
        else if (this.c < 0.0) { quatString = "${quatString}${this.c}j" }
        
        if (this.d == 1.0 && quatString.length == 0) { quatString = "${quatString}k" }
        else if (this.d == 1.0) { quatString = "${quatString}+k" }
        else if (this.d == -1.0) { quatString = "${quatString}-k" }
        else if (this.d > 0.0) { quatString = "${quatString}+${this.d}k" }
        else if (this.d < 0.0) { quatString = "${quatString}${this.d}k" }
        
        if (quatString.length == 0) { quatString = "0" }
        
        return quatString
    }

    fun coefficients(): List<Double> {
        return listOf(this.a, this.b, this.c, this.d)
    }

    fun conjugate(): Quaternion {
        return Quaternion(this.a, -this.b, -this.c, -this.d)
    }
}

sealed interface BinarySearchTree {
    fun insert(c: String): BinarySearchTree
    fun size(): Int
    fun contains(c: String): Boolean

    fun parent(i: Int): Int { return i/2 }
    fun leftChild(i: Int): Int { return i*2 }
    fun rightChild(i: Int): Int { return i*2 +1 }

    object Empty: BinarySearchTree {
        override fun insert(c: String): BinarySearchTree {
            val newTree = NodeTree(listOf("None", c), 1)
            return newTree
        }

        override fun size(): Int {
            return 0
        }

        override fun contains(c: String): Boolean {
            return false
        }
        
        override fun toString(): String {
            return "()"
        }
    }

    data class NodeTree(val tree: List<String>, val count: Int): BinarySearchTree {
        override fun insert(c: String): BinarySearchTree {
            var newTree: MutableList<String> = tree.toMutableList()
            var insertIndexFound: Boolean = false
            var currentIndex: Int = 1

            while (!insertIndexFound) {
                if (newTree[currentIndex].get(0).code > c.get(0).code) {
                    currentIndex = leftChild(currentIndex)
                } else {
                    currentIndex = rightChild(currentIndex)
                }

                if (currentIndex >= newTree.size) {
                    val sizeIncreaseNeeded: Int = currentIndex - newTree.size +1
                    newTree.addAll(List(sizeIncreaseNeeded) {"None"})
                }

                if (newTree[currentIndex] == "None") {
                    insertIndexFound = true
                }
            }
            newTree[currentIndex] = c

            return NodeTree(newTree.toList(), count +1)
        }

        override fun size(): Int {
            return count
        }

        override fun contains(c: String): Boolean {
            return tree.contains(c)
        }
        
        override fun toString(): String {
            var outputString: String = tree[1]
            if (tree.size > 2 && tree[2] != "None") {
                outputString = toStringHelper(outputString, 2)
            }
            if (tree.size > 3 && tree[3] != "None") {
                outputString = toStringHelper(outputString, 3)
            }
            return "(" + outputString + ")"
        }

        fun toStringHelper(c: String, i: Int): String {
            val parentStringIndex = c.indexOf(tree[parent(i)])
            var outputString: String = ""

            if (i == leftChild(parent(i))) {
                val insertingString = "(".plus(tree[i]).plus(")")
                outputString = c.substring(0, parentStringIndex).plus(insertingString).plus(c.substring(parentStringIndex))
            } else {
                val insertingString = "(".plus(tree[i]).plus(")")
                outputString = c.substring(0, parentStringIndex +1).plus(insertingString).plus(c.substring(parentStringIndex +1))
            }

            if (leftChild(i) < tree.size && tree[leftChild(i)] != "None") {
                outputString = toStringHelper(outputString, leftChild(i))
            }
            if (rightChild(i) < tree.size && tree[rightChild(i)] != "None") {
                outputString = toStringHelper(outputString, rightChild(i))
            }

            return outputString
        }
    }
}