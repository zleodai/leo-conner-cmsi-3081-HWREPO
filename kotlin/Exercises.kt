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

// Write your Quaternion data class here

// Write your Binary Search Tree interface and implementing classes here
