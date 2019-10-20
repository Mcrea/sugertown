package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class LiftOff implements Runnable
{
    int countDown = 10;
    private static int taskCount = 0;
    private final int id = taskCount++;
    public LiftOff(){}
    public LiftOff(int countDown)
    {
        this.countDown = countDown;
    }
    public String status()
    {
        return "#" + id +" : " + (countDown > 0 ? countDown : "LiftOff!");
    }
    @Override
    public void run()
    {
        while (countDown-- > 0)
        {
            System.out.println(status());
            Thread.yield();
        }

    }

    public static void main(String[] args) {
//        simple();
//        simple2();
        withExecutor();
        System.out.println("waiting for liftOff");
    }
    //当前线程
    public static void simple()
    {
        LiftOff lo = new LiftOff();
        lo.run();
    }
    //另起新线程
    public static void simple2()
    {
        LiftOff lo = new LiftOff();
        Thread t = new Thread(lo);
        t.start();
    }
    //执行器Executor，管理Thread对象
    public static void withExecutor()
    {
        ExecutorService service = Executors.newCachedThreadPool();
        ExecutorService service1 = Executors.newFixedThreadPool(3);
        ExecutorService service2 = Executors.newSingleThreadExecutor();
        for (int i = 0;i < 5;i++)
        {
            service1.execute(new LiftOff());
        }
        service.shutdown();
    }

}
