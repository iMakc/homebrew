require "formula"

class Dante < Formula
  homepage "http://www.inet.no/dante/"
  url "http://www.inet.no/dante/files/dante-1.4.1.tar.gz"
  mirror "ftp://ftp.inet.no/pub/socks/dante-1.4.1.tar.gz"
  sha1 "17ded4322d78b7b031da23cd4e03dbb14f397d71"

  depends_on "miniupnpc" => :optional

  bottle do
    cellar :any
    sha1 "2d75acdb4024c23ea3834eb2f5e95813f93c8b94" => :yosemite
    sha1 "7f078e852cc57c0265ce8b334b2aa1111397fd76" => :mavericks
    sha1 "d09ccfb1ad49ec06acd1200f43716eb79d71618d" => :mountain_lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}/dante"
    system "make", "install"
  end

  test do
    system "#{sbin}/sockd", "-v"
  end
end
