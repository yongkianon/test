package util;

public class Swap2Vars {

  public static void main(String[] args) {
    int a = 11;
    int b = 12;
    println("a = " + a + ", b = " + b);

    a = a + b;
    b = a - b;
    a = a - b;
    println("a = " + a + ", b = " + b);

    a ^= b;
    b ^= a;
    a ^= b;
    println("a = " + a + ", b = " + b);
  }

  private static void println(Object o) {
    System.out.println(o);
  }

}

