package process;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class StartProcess {

  public static void main(String[] args) throws Exception {

    String command = "pwd";
    int seconds = 3;

    if (args.length == 1) {
      command = args[0].trim();
    } else if (args.length == 2) {
      command = args[0].trim();
      seconds = Integer.parseInt(args[1]);
    }

    if (!"".equals(command)) {
      Process p = Runtime.getRuntime().exec(command);
      new IOStreamWriter(p.getInputStream(), System.out);
      delay(seconds);
      new IOStreamWriter(p.getErrorStream(), System.err);
      delay(seconds);
      p.waitFor();
      System.out.println(command + " exit with value = " + p.exitValue());
    }

  }


  private static void delay(int seconds) throws Exception {
    Thread.sleep(seconds * 1000);
  }

  private static class IOStreamWriter extends Thread {
    OutputStream os;
    InputStream is;

    public IOStreamWriter(InputStream is, OutputStream os) {
      this.is = is;
      this.os = os;
      start();
    }

    public void run() {
      byte b[] = new byte[8 * 1024];
      int rc;
      try {
        while ((rc = is.read(b)) > 0) {
          os.write(b, 0, rc);
        }
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

}

