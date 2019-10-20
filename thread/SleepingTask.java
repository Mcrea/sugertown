package thread;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class SleepingTask extends LiftOff
{
    //每条新线程都创建random实例的话，得到的随机数是一致的。
    static Random random = new Random(47);
    @Override
    public void run()
    {
        try
        {
//            while (super.countDown-- > 0)
//            {
//                System.out.println(super.status());
//                TimeUnit.MICROSECONDS.sleep(100);
//            }
            int sec = random.nextInt(10);
            TimeUnit.MILLISECONDS.sleep(sec * 1000);
            System.out.println(sec);
        }
        catch (Exception e)
        {}
    }

    public static void main(String[] args) {
        ExecutorService service = Executors.newCachedThreadPool();
        for (int i = 0;i < 5;i++)
        {
            service.execute(new SleepingTask());
        }
        service.shutdown();
    }
}
