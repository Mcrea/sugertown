package thread;

public class ThreadException
{
    public static void main(String[] args) {
        try
        {
            Thread t = new Thread(new Runnable() {
                @Override
                public void run() {
                    throw new RuntimeException("666");
                }
            });
            t.start();
        }
        catch (Exception e)
        {
            System.out.println("exo?");
        }
    }
}
