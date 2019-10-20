package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class AtomicityTest implements Runnable
{
    //volatile对禁止访问不稳定状态没有帮助，而且long和double之外的基本类型不需要这个修饰
    private volatile int i = 0;
    public int getValue()
    {
        return i;
    }
    public synchronized void evenIncrement()
    {
        i++;
        i++;
    }
    @Override
    public void run() {
        while (true)
        {
            evenIncrement();
        }
    }

    public static void main(String[] args) {
        ExecutorService service = Executors.newCachedThreadPool();
        AtomicityTest at = new AtomicityTest();
        service.execute(at);
        while (true)
        {
            int val = at.getValue();
            if (val % 2 != 0)
            {
                System.out.println(val);
                System.exit(0);
            }
        }
    }
}
