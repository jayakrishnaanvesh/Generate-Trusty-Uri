# Generate-Trusty-Uri

This project aims at making digital artifacts such as datasets, code, texts, and images verifiable and permanent.The digital artifacts that are supposed to be immutable, are vulnerable to being changed by some external entities. Moreover, there is no commonly accepted method to enforce this immutability.
To solve this problem, in this project we would like to implement periodic generation and checking of cryptographic hash values generated for file which include both text and images. We show how cryptographic hash values can be used for the verification of digital artifacts. We demonstrate the verifiability and reliability of the data in the files that are supposed to be immutable. The implementation of this system will remain applicable for large files as well.
The main steps being implemented as part of this project are - when a set of data is being uploaded by a data owner it is transformed into a cryptographic code. When an attacker tries to modify the data, this will be checked either when data owner logs into the system or periodically. The same will be notified to the data owner. Once the data owner finds out about this breach he can alert himself by either deleting the data or replacing it with the original data.


2.4.4 Steps to calculate hash value for the image
A blockhash SHOULD be calculated following these steps:
1.	Convert the image to RGB format with an optional alpha channel (if not already done). The standard conversion method of the file format SHOULD be used, avoiding any file- or system-specific colour profiles. Any orientation tag in the image metadata SHOULD be applied.
2.	Construct a grid of N by N blocks covering the image. N MUST be a multiple of 4.
3.	Initialize each block to 0.
4.	For each pixel:
a. Decide which blocks the pixel overlaps. It can be one, two or four blocks, depending on the pixel coordinate.
b. If the image has an alpha channel and the alpha for the pixel is 0 (indicating transparency), set the RGB components to their maximum values, otherwise use them as they are.
c. Add the sum of the RGB components from the previous step to each of the blocks the pixel covers, in proportion to the area of the pixel that is in each block.
5.	Divide the block grid into four horizontal groups, each containing N columns and N/4 rows. For each group, determine the median value of all the blocks contained in the group.
6.	Let H be the theoretically maximum cumulative value of all pixels in a block divided by two (half the value space).
7.	For each block, starting with the upper left and progressing row by row until the lower right, add a bit to the result hash:
a. If the block value is higher than the median value of the horizontal group the block belongs to, add a 1.
b. If the block value and median have the same value, and the median is above H, add a 1. Note that imprecisions from floating point calculations or other implementation details must be taken into consideration when determining if the block value and the median are the same value.
c. Otherwise, add a 0.
8.	Encode the hash in hexadecimal, interpreting the sequence of bits as eight-bit bytes.
9.	Construct a blockhash URN according to the grammar above using the hexadecimal representation of the hash.


2.3.1 Constants

The initial values of BLAKE-512 are as follows:
IV0 = 6A09E667F3BCC908 		IV1 = BB67AE8584CAA73B
IV2 = 3C6EF372FE94F82B		IV3 = A54FF53A5F1D36F1
IV4 = 510E527FADE682D1		IV5 = 9B05688C2B3E6C1F
IV6 = 1F83D9ABFB41BD6B 	IV7 = 5BE0CD19137E2179

BLAKE-512 uses the constants
c0 = 243F6A8885A308D3		c1 = 13198A2E03707344
c2 = A4093822299F31D0		c3 = 082EFA98EC4E6C89
c4 = 452821E638D01377		c5 = BE5466CF34E90C6C
c6 = C0AC29B7C97C50DD		c7 = 3F84D5B5B5470917
c8 = 9216D5D98979FB1B		c9 = D1310BA698DFB5AC
c10 = 2FFD72DBD01ADFB7	c11 = B8E1AFED6A267E96
c12 = BA7C9045F12C7F99		c13 = 24A19947B3916CF7
c14 = 0801F2E2858EFC16		c15 = 636920D871574E69

2.3.2 Compression function

The compression function of BLAKE-512 is defined as follows and makes
16 rounds instead of 14, and that Gi(a, b, c, d) computes


a   a + b + (m sigmar(2i) xor c sigmar(2i+1))
d  (d xor a)>>>32
c   c + d
b   (b xor c)>>>25
a   a + b + (m sigmar(2i+1) xor c sigmar(2i))
d  (d xor a)>>>16
c   c + d
b   (b xor c)>>>11

The only differences with BLAKE-256’s Gi are the word length (64 bits instead of 32) and the rotation distances. At round r > 9, the permutation used is sigma r mod 10 (for example, in the last round r = 15 and the permutation sigma 15 mod 10 = sigma 5 is used).



TOMCAT CLUSTERING:

AcceptFilter http none
AcceptFilter https none
# AJP13 Proxy
<IfModule mod_proxy.c>
<IfModule mod_proxy_ajp.c>
Include "conf/extra/httpd-ajp.conf"
</IfModule>
</IfModule>

LoadModule jk_module  modules/mod_jk.so
JkWorkersFile conf/workers.properties
#JKShmFile logs/mod_jk.shm
JkLogLevel info
JkLogFile logs/mod_jk.log
JkMount /pro/* lb

<Location /jkmanager/>
 JkMount jkstatus
 Order deny,allow
 Deny from all
 Allow from 127.0.0.1
</Location>


CODE TO RUN THREAD ON SERVER:

  Runnable runnable = new Runnable() {
  public void run() {
  // task to run goes here
  String file="C:/Tomcat 9.0/webapps/pro/"+"c.txt";
  String content="",c="";}
  ScheduledExecutorService service = Executors
  newSingleThreadScheduledExecutor();
  service.scheduleAtFixedRate(runnable, 0, 1, TimeUnit.MINUTES);

ScriptEngineManager manager = new ScriptEngineManager();
ScriptEngine engine = manager.getEngineByName("JavaScript");
engine.eval(Files.newBufferedReader(Paths.get("C:/Tomcat9.0/webapps/pro/blake512.js"), StandardCharsets.UTF_8));
Invocable inv = (Invocable) engine;        
c=sb.toString();
content=c.substring(0, c.length()-1);
String con=(String)inv.invokeFunction("blake512", content,"asdfasdfasdfqwee",true);
