package ua.varus.antifraud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import ua.varus.antifraud.domain.charts.DonutChart;
import ua.varus.antifraud.service.ChartsService;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class DashBoardController {
    @Autowired
    private ChartsService chartsService;

    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/ajax/getOnlineUsersChart", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<DonutChart> getOnlineUsersChart(){
        return chartsService.onlineUsersChart();
    }
}
