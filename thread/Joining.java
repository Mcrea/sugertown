package thread;

public class Joining
{
    public static void main(String[] args) {
        Sleeper s1 = new Sleeper(1500, "Alex");
        Sleeper s2 = new Sleeper(2500, "Bob");
        Joiner j1 = new Joiner("AlexJ", s1);
        Joiner j2 = new Joiner("BobJ", s2);
//        s2.interrupt();

    }

}
class Sleeper extends Thread
{
    private int duration;
    public Sleeper(int sleepTime, String name)
    {
        super(name);
        duration = sleepTime;
        start();
    }
    public void run()
    {
        try {
            sleep(duration);
        } catch (InterruptedException e) {
            System.out.println(getName() + " was interrupted.");
            System.out.println(getName() + " is interrupted() : " + isInterrupted());
        }
        System.out.println(getName() + " has awakened");
    }
}
class Joiner extends Thread
{
    private Sleeper s;
    public Joiner(String name, Sleeper sleeper)
    {
        super(name);
        s = sleeper;
        start();
    }
    @Override
    public void run()
    {
        try {
            System.out.println(getName() + " was started");
            s.join();
        } catch (InterruptedException e) {
            System.out.println("interrupted");
        }
        System.out.println(getName() + " join completed");
    }
}

