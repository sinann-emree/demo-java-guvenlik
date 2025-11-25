# --- 1. AŞAMA: Derleme (Builder) ---
# İçinde Java Derleyicisi (javac) olan Geliştirici İmajı
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY Main.java .
# Kodu derleyip .class dosyası yapıyoruz
RUN javac Main.java

# --- 2. AŞAMA: Çalıştırma (Final Minimal) ---
# Sadece Çalıştırma Motoru (JRE) olan ÇOK KÜÇÜK imaj
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# İlk aşamadan sadece derlenmiş dosyayı al
COPY --from=builder /app/Main.class .
# Başlat
CMD ["java", "Main"]