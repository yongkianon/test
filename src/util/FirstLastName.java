package util;

public class FirstLastName {

  public static void main(String[] args) {
    test_concat1(null, null);
    test_concat1("   ", "    ");
    test_concat1("KO ", " YO ");
    test_concat1("YO ", " YO ");
    println("========================");
    test_concat2(null, null);
    test_concat2("   ", "    ");
    test_concat2("KO ", " YO ");
    test_concat2("YO ", " YO ");
    println("========================");
    test_concat(null, null);
    test_concat("   ", "    ");
    test_concat("KO ", " YO ");
    test_concat("YO ", " YO ");
  }


  private static void test_concat1(String first, String last) {
    println("Full Name = [" + concat1(first, last) + "]");
  }

  private static void test_concat2(String first, String last) {
    println("Full Name = [" + concat2(first, last) + "]");
  }

  private static void test_concat(String first, String last) {
    println("Full Name = [" + concat(first, last) + "]");
  }


  public static String concat1(String first, String last) {
    return first + " " + last;
  }

  public static String concat2(String first, String last) {
    if (first != null) {
      first = first.trim();
    } else {
      first = "";
    }

    if (last != null) {
      last = last.trim();
    } else {
      last = "";
    }

    if (first.equalsIgnoreCase(last)) {
      return first;
    }

    return (first + " " + last).trim();
  }

  private static void println(Object o) {
    System.out.println(o);
  }

  public static String concat(String first, String last) {
    first = format(first);
    last = format(last);

    if (first.equalsIgnoreCase(last)) {
      return first;
    }

    return format1(first + " " + last);
  }

  public static String format(final String s) {
    return s != null ? s.trim() : "";
  }

  public static String format1(final String s) {
    if (s != null) {
      return s.trim();
    }
    return "";
  }

}

