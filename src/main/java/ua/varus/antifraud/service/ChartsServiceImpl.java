package ua.varus.antifraud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.domain.charts.DonutChart;

import java.awt.*;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
public class ChartsServiceImpl implements ChartsService {
    private String randomRGB(){
        Random random = new Random();
        final float hue = random.nextFloat();
        final float saturation = (random.nextInt(2000) + 1000) / 10000f;
        final float luminance = 0.9f;
        final Color color = Color.getHSBColor(hue, saturation, luminance);
        String rgb = Integer.toHexString(color.getRGB()).substring(2).toUpperCase();

        return "#"+rgb;
    }

    @Autowired
    private UserService userService;

    @Override
    public List<DonutChart> onlineUsersChart() {
        List<User> userList = userService.getOnlineUsers();
        List<DonutChart> listOnline =  userList.stream().collect(
                Collectors.groupingBy(u->new String(u.isOnline()?"online":"offline"),
                        Collectors.counting())).entrySet().stream()
                .map(x -> new DonutChart(x.getValue(),x.getKey(), randomRGB(), randomRGB()))
                .collect(Collectors.toList());

        return listOnline;
    }
}
