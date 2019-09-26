package java8.cha2;

import java8.cha1.Apple;

import java.util.Comparator;
import java.util.List;

public class Client {
    public static void main(String[] args) {
        List<Apple> apples = Apple.fillAppleList();
        apples.sort(new Comparator<Apple>() {
            @Override
            public int compare(Apple o1, Apple o2) {
                return o1.getColor().compareTo(o2.getColor());
            }
        });
        System.out.println(apples);
        apples.sort((Apple a1, Apple a2) -> a1.getWeight() - a2.getWeight());
        System.out.println(apples);

    }
}
