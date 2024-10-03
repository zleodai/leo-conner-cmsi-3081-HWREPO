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
        val newPhrase = ChainableString(phrase.plus(" ").plus(stringSuffix))
        return newPhrase
    }
}

fun say(string: String? = null): ChainableString {
    val defaultCase: String = ""
    val newChainableString: ChainableString = ChainableString(string ?: defaultCase)

    return newChainableString
}

fun meaningfulLineCount(filePath: String): Long {
    var fileReader: FileReader

    try {
        fileReader = FileReader(filePath)
    } catch (e: Exception) {
        throw IOException("No such file")
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
        val productQuaternion = Quaternion((this.a * a.a) - (this.b * a.b) - (this.c * a.c) - (this.d * a.d),
                                       (this.a * a.b) + (this.b * a.a) + (this.c * a.d) - (this.d * a.c),
                                       (this.a * a.c) - (this.b * a.d) + (this.c * a.a) + (this.d * a.b),
                                       (this.a * a.d) + (this.b * a.c) - (this.c * a.b) + (this.d * a.a))

        return productQuaternion
    }

    operator fun plus(a: Quaternion): Quaternion {
        val sumQuaternion = Quaternion(this.a + a.a, this.b + a.b, this.c + a.c, this.d + a.d)
        return sumQuaternion
    }

    override operator fun equals(a: Any?): Boolean {
        if (a is Quaternion) { return this.a == a.a && this.b == a.b && this.c == a.c && this.d == a.d }
        return false
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

data class TreeNode(val c: String, val left: TreeNode? = null, val right: TreeNode? = null): Comparable<TreeNode> {
    override operator fun equals(a: Any?): Boolean {
        if (a is TreeNode) { return this.c == a.c }
        return false
    }

    override operator fun compareTo(a: TreeNode): Int {
        if (this.c.get(0).code > a.c.get(0).code) return 1
        if (this.c.get(0).code < a.c.get(0).code) return -1
        return 0
    }

    fun insertLeft(newC: String): TreeNode {
        return TreeNode(this.c, TreeNode(newC), this.right?.let {this.right.copy()} ?: null)
    }

    fun insertRight(newC: String): TreeNode {
        return TreeNode(this.c, this.left?.let {this.left.copy()} ?: null, TreeNode(newC))
    }

    fun copy(): TreeNode {
        return TreeNode(this.c, this.left?.let {this.left.copy()} ?: null, this.right?.let {this.right.copy()} ?: null) 
    }

    fun hasLeft(): Boolean {
        this.left?.let { return true }
        return false
    }

    fun hasRight(): Boolean {
        this.right?.let { return true }
        return false
    }
} 

sealed interface BinarySearchTree {
    fun insert(c: String): BinarySearchTree
    fun size(): Int
    fun contains(c: String): Boolean

    object Empty: BinarySearchTree {
        override fun insert(c: String): BinarySearchTree {
            val newNode = TreeNode(c)
            val newTree = NodeTree(newNode)
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

    data class NodeTree(var root: TreeNode): BinarySearchTree {
        override fun insert(c: String): BinarySearchTree {
            val newNode = TreeNode(c)
            val newTree = NodeTree(newNode)
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
}