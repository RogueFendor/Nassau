import java.util.*;

public class Parser{
   public static void main(String [] args){

       int id = Integer.parseInt(args[0]);
       switch(id){

         case 1: sourceSetUp(args[1]);break;
         case 2: checkValidDigits(args[1]);break;
         case 3: addMerkleRoot(args[1]);break;
         case 4: addGenesiBlock(args[3]);break;
         case 5: capitalToSmall(args[1]);break;
         case 6: returnBase58(args[1]);break;
       }

   }
   public static void returnBase58(String args){

    String letter = args.substring(0, 1);
    Map<String, Integer> base58 = new HashMap<String, Integer>();
       base58.put("A", 9 );    
       base58.put("D", 12);      
       base58.put("H", 16);      
       base58.put("M", 20);      
       base58.put("R", 24);      
       base58.put("V", 28);      
       base58.put("Z", 32);      
       base58.put("d", 36);      
       base58.put("h", 40);      
       base58.put("m", 44);      
       base58.put("q", 48);      
       base58.put("u", 52);      
       base58.put("y", 56);     
       base58.put("B", 10);
       base58.put("E", 13);
       base58.put("J", 17);
       base58.put("N", 21);
       base58.put("S", 25);
       base58.put("W", 29);
       base58.put("a", 33);
       base58.put("e", 37);
       base58.put("i", 41);
       base58.put("n", 45);
       base58.put("r", 49);
       base58.put("v", 53);
       base58.put("z", 57);
       base58.put("G", 15);
       base58.put("L", 19);
       base58.put("l", 19);
       base58.put("Q", 23);
       base58.put("U", 27);
       base58.put("Y", 31);
       base58.put("c", 35);
       base58.put("g", 39);
       base58.put("k", 43);
       base58.put("p", 47);
       base58.put("t", 51);
       base58.put("x", 55);
       base58.put("C", 11);
       base58.put("F", 14);
       base58.put("K", 18);
       base58.put("P", 22);
       base58.put("T", 26);
       base58.put("X", 30);
       base58.put("b", 34);
       base58.put("f", 38);
       base58.put("j", 42);
       base58.put("o", 46);
       base58.put("s", 50);
       base58.put("w", 54);
       System.out.println(base58.get(letter));


   }
   public static void capitalToSmall(String args){
       
       String line = args.toLowerCase();
       line.replaceAll(" ","");
       System.out.println("apt-get remove "+line);
       System.exit(0);
   }
   public static void addMerkleRoot(String args){
        System.out.println(args);
        System.exit(0);
   }
   public static void addGenesiBlock(String args){
        System.out.println(args);
        System.exit(0);
   }
   public static void sourceSetUp(String args){
    if(args.contains("coin")){
      String val = args.replaceAll("coin","");
        System.out.println(val);
        System.exit(0);
    }
      if(args.contains("Coin")){
      String val = args.replaceAll("Coin","");
        System.out.println(val);
        System.exit(0);
    }
    if(args.contains("COIN")){
      String val = args.replaceAll("COIN","");
        System.out.println(val);
        System.exit(0);
    }
    else{
       System.out.println(args);
       System.exit(0);

    }
   }
   public static void checkValidDigits(String digits){
           if(digits.length() == 4){
             int val =0;
             try{
                  val = Integer.parseInt(digits);

             }
             catch(NumberFormatException e){
                 val = 0;
             }
             System.out.println(val);
         }
         else{
           System.out.println("0");
         }
         
   }

}