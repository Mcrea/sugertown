package thread;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class EvenGenerator extends IntGenerator
{
    private int currEvenValue = 0;
    private Lock lock = new ReentrantLock();
    @Override
    public int next()
    {
        lock.lock();
        try
        {
            ++currEvenValue;
            ++currEvenValue;
            return currEvenValue;
        }
        finally
        {
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        EvenChecker.test(new EvenGenerator());
    }
}
