package java8.cha1;

public class DefaultMethodClient implements DefaultMehtodIntf {
    public static void main(String[] args) {
        DefaultMehtodIntf dm = new DefaultMethodClient();
        dm.defaultSayHello("Alex");
    }
}
