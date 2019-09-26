package java8.cha1;

public interface DefaultMehtodIntf {
    default void defaultSayHello(String name)
    {
        System.out.println("hello, " + name);
    }
}
