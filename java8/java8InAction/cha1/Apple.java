package java8.cha1;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class Apple {
    private String color;
    private int weight;
    public static List<Apple> filterApples(List<Apple> inventory,
                                           Predicate<Apple> p) {
        List<Apple> result = new ArrayList<>();
        for (Apple apple: inventory){
            if (p.test(apple)) {
                result.add(apple);
            }
        }
        return result;
    }
    public static <T> List<T> filterApplesByStream(List<T> inventory,
                                           Predicate<T> p) {
        List<T> result = inventory.stream().filter(p).collect(Collectors.toList());
        return result;
    }
    public static boolean isGreenApple(Apple apple) {
        return "green".equals(apple.getColor());
    }
    public static boolean isHeavyApple(Apple apple) {
        return apple.getWeight() > 150;
    }
    public boolean isLightApple(Apple apple) {
        return apple.getWeight() < 150;
    }
    public boolean isLightApple2() {
        return this.getWeight() < 150;
    }
    public static List<Apple> fillAppleList()
    {
        List<Apple> appleList = new ArrayList<Apple>(10);
        appleList.add(new Apple("red", 100));
        appleList.add(new Apple("yellow", 200));
        appleList.add(new Apple("green", 300));
        appleList.add(new Apple("green", 400));
        appleList.add(new Apple("blue", 100));
        appleList.add(new Apple("black", 200));
        appleList.add(new Apple("white", 300));
        appleList.add(new Apple("pink", 400));
        appleList.add(new Apple("red", 100));
        appleList.add(new Apple("green", 600));
        return appleList;
    }
    public Apple(String color, int weight){
        this.color = color;
        this.weight = weight;
    }

    @Override
    public String toString() {
        return this.color + "," + this.weight;
    }

    public String getColor() {
        return this.color;
    }
    public int getWeight(){
        return this.weight;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public void setWeight(int weight){
        this.weight = weight;
    }

}
