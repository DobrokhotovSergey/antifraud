package ua.varus.antifraud.test;

import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

public class Test {


    public int slowInit() {
        int i = 0;
        try {
            Thread.sleep(4000);
            i = 10;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return i;

    }


    public void promiseTestNext() throws InterruptedException, ExecutionException {
        CompletableFuture<Void> future =
                CompletableFuture
                .supplyAsync(this::slowInit)
                .thenAccept(
                        (res)->{
                            System.out.println("finished" + res);
                        })
                .thenRun(
                        ()->{
                            System.out.println("look at Results");
                        }

                );
        System.out.println("TESTING");
        future.get();


        System.out.println("future test is finished");
    }

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        Test test = new Test();
        test.promiseTestNext();
    }

}
