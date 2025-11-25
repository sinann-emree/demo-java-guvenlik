# --- 1. AŞAMA: Derleme (Builder) ---
# İçinde Java Derleyicisi (javac) olan büyük imaj
FROM amazoncorretto:17-alpine-jdk AS builder
WORKDIR /app
COPY Main.java .
# Kodu derleyip .class dosyası yapıyoruz
RUN javac Main.java

# --- 2. AŞAMA: Çalıştırma (Final Minimal) ---
# Sadece Çalıştırma Motoru (JRE) olan küçük imaj
FROM amazoncorretto:17-alpine-jre
WORKDIR /app
# İlk aşamadan sadece derlenmiş dosyayı al
COPY --from=builder /app/Main.class .
# Başlat
CMD ["java", "Main"]