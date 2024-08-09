import java.util.List;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;

public class ExercisesTest {

    HashMap<Boolean, Integer> counts = new HashMap<>(Map.of(true, 0, false, 0));

    void suite(String name) {
        System.out.printf("\nTesting %s", name);
    }

    void check(boolean condition) {
        counts.put(condition, counts.get(condition) + 1);
        System.out.print(condition ? " ." : " F");
    }

    void checkThrows(Callable<?> c, Class<? extends Exception> exception, String message) {
        try {
            c.call();
            check(false);
        } catch (Exception e) {
            check(exception.isInstance(e) && e.getMessage().contains(message));
        }
    }

    public static void main(String[] args) throws IOException{
        new ExercisesTest().run();
    }

    void run() throws IOException {
        suite("change");
        checkThrows(
            () -> Exercises.change(-50),
            IllegalArgumentException.class,
            "Amount cannot be negative");
        check(Exercises.change(1).equals(List.of(0L, 0L, 0L, 1L)));
        check(Exercises.change(99).equals(List.of(3L, 2L, 0L, 4L)));
        check(Exercises.change(42).equals(List.of(1L, 1L, 1L, 2L)));
        check(Exercises.change(100000000037L).equals(List.of(4000000001L, 1L, 0L, 2L)));
        check(Exercises.change(10000000000005L).equals(List.of(400000000000L, 0L, 1L, 0L)));

        // Uncomment the following tests as you complete the exercises
        // and remove this comment that tells you to uncomment!

        // suite("firstThenLowerCase");
        // check(Exercises.firstThenLowerCase(List.of(), s -> !s.isEmpty()).isEmpty());
        // check(Exercises.firstThenLowerCase(List.of("", "A", "B"), s -> !s.isEmpty()).get().equals("a"));
        // check(Exercises.firstThenLowerCase(List.of("", "A", "ABC"), s -> s.length() > 3).isEmpty());
        // check(Exercises.firstThenLowerCase(List.of("ABC", "ABCD", "ABCDE"), s -> s.length() > 3).get().equals("abcd"));

        // suite("say");
        // check(Exercises.say().equals(""));
        // check(Exercises.say("hi").ok().equals("hi"));
        // check(Exercises.say("hi").and("there").ok().equals("hi there"));
        // check(Exercises.say("hello").and("my").and("name").and("is").and("Colette").ok().equals("hello my name is Colette"));
        // check(Exercises.say("h i").ok().equals("h i"));
        // check(Exercises.say("hi ").and("   there").ok().equals("hi     there"));
        // check(Exercises.say("").and("").and("dog").and("").and("go").ok().equals("  dog  go"));
        // check(Exercises.say("😄🤗").and("💀👊🏾").ok().equals("😄🤗 💀👊🏾"));

        // suite("miscFileStats");
        // checkThrows(
        //     () -> Exercises.miscFileStats("NoSuchFile.txt"),
        //     FileNotFoundException.class,
        //     "No such file");
        // var stats = Exercises.miscFileStats("../test-for-line-count.txt");
        // check(stats.size() == 3);
        // check(stats.get("lineCount") == 13);
        // check(stats.get("blankLineCount") == 7);
        // check(stats.get("hashedLineCount") == 2);

        // suite("Quaternion");
        // checkThrows(() -> new Quaternion(Double.NaN, 0, 0, 0), IllegalArgumentException.class, "Coefficients cannot be NaN");
        // checkThrows(() -> new Quaternion(0, Double.NaN, 0, 0), IllegalArgumentException.class, "Coefficients cannot be NaN");
        // checkThrows(() -> new Quaternion(0, 0, Double.NaN, 0), IllegalArgumentException.class, "Coefficients cannot be NaN");
        // checkThrows(() -> new Quaternion(0, 0, 0, Double.NaN), IllegalArgumentException.class, "Coefficients cannot be NaN");

        // var q = new Quaternion(3.5, 2.25, -100, -1.25);
        // check(q.a() == 3.5);
        // check(q.b() == 2.25);
        // check(q.c() == -100.0);
        // check(q.d() == -1.25);

        // var q1 = new Quaternion(1, 3, 5, 2);
        // var q2 = new Quaternion(-2, 2, 8, -1);
        // var q3 = new Quaternion(-1, 5, 13, 1);
        // var q4 = new Quaternion(-46, -25, 5, 9);
        // check(q3.equals(q1.plus(q2)));
        // check(q4.equals(q1.times(q2)));
        // check(Quaternion.K.equals(Quaternion.I.times(Quaternion.J)));

        // check(new Quaternion(0, 0, 0, 0).coefficients().equals(List.of(0.0, 0.0, 0.0, 0.0)));
        // check(new Quaternion(2, 1.5, 10, -8).coefficients().equals(List.of(2.0, 1.5, 10.0, -8.0)));

        // check(new Quaternion(0, 0, 0, 0).toString().equals("Quaternion[a=0.0, b=0.0, c=0.0, d=0.0]"));
        // check(new Quaternion(0, -1, 0, 2.25).toString().equals("Quaternion[a=0.0, b=-1.0, c=0.0, d=2.25]"));
        // check(Quaternion.ZERO.minus(Quaternion.K).toString().equals("Quaternion[a=0.0, b=0.0, c=0.0, d=-1.0]"));

        // suite("BinarySearchTree");
        // BinarySearchTree t = new Empty();
        // check(t.size() == 0);
        // check(!t.contains("A"));
        // check(t.toString().equals("()"));
        // t = t.insert("G");
        // check(t.size() == 1);
        // check(t.contains("G"));
        // check(!t.contains("A"));
        // check(t.toString().equals("(G)"));
        // t = t.insert("B");
        // check(t.toString().equals("((B)G)"));
        // t = t.insert("D");
        // t = t.insert("H");
        // t = t.insert("A");
        // t = t.insert("C");
        // t = t.insert("J");
        // check(t.size() == 7);
        // check(t.contains("J"));
        // check(!t.contains("Z"));
        // check(t.toString().equals("(((A)B((C)D))G(H(J)))"));

        System.out.printf("\n%d passed, %d failed\n", counts.get(true), counts.get(false));
    }
}
