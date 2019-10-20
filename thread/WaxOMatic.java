package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

class Car
{
    private boolean waxOn = false;
    public synchronized void waxed()
    {
        this.waxOn = true;
        notifyAll();
    }
    public synchronized void buffed()
    {
        this.waxOn = false;
        notifyAll();
    }
    public synchronized void waitForWaxing() throws Exception
    {
        while (this.waxOn == false)
        {
            wait();
        }
    }
    public synchronized void waitForBuffing () throws Exception
    {
        while (this.waxOn == true)
        {
            wait();
        }
    }
}
class WaxOn implements Runnable
{
    private Car car;
    public WaxOn(Car car)
    {
        this.car = car;
    }

    @Override
    public void run() {
        try {
            while (!Thread.interrupted())
            {
                System.out.println("Wax on!");
                TimeUnit.MILLISECONDS.sleep(500);
                car.waxed();
                car.waitForBuffing();
            }
        }catch (Exception e)
        {
            System.out.println("exiting via interrupt");
        }
        System.out.println("ending wax on task");
    }
}
class WaxOff implements Runnable
{
    private Car car;
    public WaxOff(Car car)
    {
        this.car = car;
    }

    @Override
    public void run() {
        try {
            while (!Thread.interrupted())
            {
                car.waitForWaxing();
                System.out.println("wax off!");
                TimeUnit.MILLISECONDS.sleep(500);
                car.buffed();
            }
        }catch (Exception e)
        {
            System.out.println("exiting via interrupt");
        }
        System.out.println("ending wax off task");
    }
}
public class WaxOMatic
{
    public static void main(String[] args) throws Exception {
        Car car = new Car();
        ExecutorService service = Executors.newCachedThreadPool();
        service.execute(new WaxOn(car));
        service.execute(new WaxOff(car));
        TimeUnit.SECONDS.sleep(5);
        service.shutdownNow();
    }
}
