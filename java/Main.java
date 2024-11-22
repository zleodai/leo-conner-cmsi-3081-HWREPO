import java.io.*;

enum Color {
    RED,
    YELLOW,
    GREEN
}

public class Main{
    public static void main(String[] args) {
        var action = switch (Color.RED) {
            case Color.RED -> "stop";
            case Color.YELLOW -> "slow down";
            case Color.GREEN -> "go";
        }
        System.out.println(action);
    }
}