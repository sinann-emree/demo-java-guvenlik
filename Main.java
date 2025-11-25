public class Main {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Merhaba! Ben Minimal ve Guvenli bir JAVA uygulamasiyim.");
        // Uygulama hemen kapanmasın diye sonsuz döngüde bekletiyoruz (Sunucu taklidi)
        while(true) {
            Thread.sleep(10000);
        }
    }
}