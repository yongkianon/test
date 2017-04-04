package util;

import java.text.DecimalFormat;
import java.util.Date;

public class TimeUtils {

  public static void main(String[] args) {
    main__loop(args);
    System.out.println("<<< --- --- --- >>>");
    main__test(args);
  }

  public static void main__test(String[] args) {
    long t1 = 1234L;
    long t2 = 22 * HOUR + 63 * MINUTE;
    long t3 = 28 * HOUR + 23 * MINUTE + 32 * SECOND;
    long t4 = 30 * DAY + 23 * MINUTE + 32 * SECOND;

    System.out.println(TimeUtils.format(t1));
    System.out.println(TimeUtils.format(t2));
    System.out.println(TimeUtils.format(t3));
    System.out.println(TimeUtils.format(t4));

    System.out.println("<<< --- --- --- >>>");

    System.out.println(TimeUtils.getDuration(t1));
    System.out.println(TimeUtils.getDuration(t2));
    System.out.println(TimeUtils.getDuration(t3));
    System.out.println(TimeUtils.getDuration(t4));
  }

  public static void main__loop(String[] args) {
    long start, end;

    long t1 = 1234L;
    long t2 = 22 * HOUR + 63 * MINUTE;
    long t3 = 28 * HOUR + 23 * MINUTE + 32 * SECOND;
    long t4 = 30 * DAY + 23 * MINUTE + 32 * SECOND;

    int max = 800 * 1000;
    if (args.length == 1) {
      max = Integer.parseInt(args[0]);
    }

    start = System.currentTimeMillis();
    for (int i = 0; i < max; i++) {
      TimeUtils.format(t1);
      TimeUtils.format(t2);
      TimeUtils.format(t3);
      TimeUtils.format(t4);
    }
    end = System.currentTimeMillis();
    System.out.println(TimeUtils.format(end, start));

    System.out.println("--- --- ---");

    start = System.currentTimeMillis();
    for (int i = 0; i < max; i++) {
      TimeUtils.getDuration(t1);
      TimeUtils.getDuration(t2);
      TimeUtils.getDuration(t3);
      TimeUtils.getDuration(t4);
    }
    end = System.currentTimeMillis();
    System.out.println(TimeUtils.format(end, start));
  }

  public static String getDuration(long diff) {
    long second = (diff / 1000) % 60;
    long minute = (diff / (1000 * 60)) % 60;
    long hour = diff / (1000 * 60 * 60);
    long day = (diff / (1000 * 60 * 60)) / 24;
    return formatString(day, hour, minute, second);
  }

  public static String getDuration(Date end, Date start) {
    return getDuration(end.getTime(), start.getTime());
  }

  public static String getDuration(long end, long start) {
    return getDuration(Math.abs(end - start));
  }

  public static String format(long diff) {
    long day = 0, hour = 0, minute = 0, second = 0;

    while (diff >= DAY) {
      day++;
      diff -= DAY;
    }

    while (diff >= HOUR) {
      hour++;
      diff -= HOUR;
    }

    while (diff >= MINUTE) {
      minute++;
      diff -= MINUTE;
    }

    while (diff >= SECOND) {
      second++;
      diff -= SECOND;
    }

    return formatString(day, hour, minute, second);
  }

  private static String formatString(long day, long hour, long minute, long second) {
    DecimalFormat df = new DecimalFormat("00");
    String s = df.format(hour) + ":" + df.format(minute) + ":" + df.format(second);

    if (day == 1) {
      s = day + " day " + s;
    } else if (day > 1) {
      s = day + " days " + s;
    }

    return s;
  }

  private static int calc__BAK(long diff, int uom) {
    int unit = 0;
    while (diff >= uom) {
      unit++;
      diff -= uom;
    }
    return unit;
  }

  public static String format(long end, long start) {
    return format(Math.abs(end - start));
  }

  private static final long SECOND = 1000;
  private static final long MINUTE = 60 * SECOND;
  private static final long HOUR = 60 * MINUTE;
  private static final long DAY = 24 * HOUR;

}

