package ua.varus.antifraud.test;

import lombok.AllArgsConstructor;
import lombok.Data;
import ua.varus.antifraud.domain.charts.DonutChart;

import java.awt.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

public class Test2 {
    private  String randomRGB(){
        Random random = new Random();
        final float hue = random.nextFloat();
        final float saturation = (random.nextInt(2000) + 1000) / 10000f;
        final float luminance = 0.9f;
        final Color color = Color.getHSBColor(hue, saturation, luminance);
        String rgb = Integer.toHexString(color.getRGB()).substring(2).toUpperCase();

        return "#"+rgb;
    }
    public static void main(String[] args) {

        //3 apple, 2 banana, others 1
        List<Item> items = Arrays.asList(
                new Item("apple", 10, new BigDecimal("9.99"), true),
                new Item("banana", 20, new BigDecimal("19.99"), true),
                new Item("orang", 10, new BigDecimal("29.99"), true),
                new Item("watermelon", 10, new BigDecimal("29.99"),false),
                new Item("papaya", 20, new BigDecimal("9.99"), false),
                new Item("apple", 10, new BigDecimal("9.99"),false),
                new Item("banana", 10, new BigDecimal("19.99"),true),
                new Item("apple", 20, new BigDecimal("9.99"),true)
        );
        Test2 t = new Test2();
        String randomColor = t.randomRGB();
        Map<String, Long> counting = items.stream().collect(
                Collectors.groupingBy(u->new String(u.isOnline()?"online":"offline"), Collectors.counting()));
        List<DonutChart> map =  counting.entrySet().stream()
                .map(x -> new DonutChart(x.getValue(),x.getKey(), new String(t.randomRGB()), new String(randomColor)))
                .collect(Collectors.toList());

        System.out.println(map);

//        Map<String, Integer> sum = items.stream().collect(
//                Collectors.groupingBy(Item::getName, Collectors.summingInt(Item::getQty)));
//
//        System.out.println(sum);

    }
}
@Data
class Item {

    private String name;
    private int qty;
    private BigDecimal price;
    private boolean online;

    public Item(String name, int qty, BigDecimal price, boolean online) {
        this.name = name;
        this.qty = qty;
        this.price = price;
        this.online = online;
    }
    //constructors, getter/setters
}