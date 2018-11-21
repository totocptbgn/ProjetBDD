import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class RandomiseName {
    Scanner sc;
    public static PrintWriter createFile(String fileName){
        try {
            PrintWriter pw = new PrintWriter(fileName, "UTF-8");
            return pw;
        } catch (FileNotFoundException e){
            e.printStackTrace();
        } catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        return null;
    }

    public void generate(String path, int n){
        try {
            this.sc = new Scanner(new File(path));
        } catch (FileNotFoundException e){
            System.out.println("\n      The file was not found...");
            System.out.println("      Done.\n");
            System.exit(1);
        }

        ArrayList<String> firstNameM = new ArrayList<>();
        ArrayList<String> firstNameF= new ArrayList<>();
        ArrayList<String> name = new ArrayList<>();

        String [] lines = new String[3];
        for (int i = 0; i < 3; i++) {
            lines[i] = sc.nextLine();
        }

        Scanner [] scan = new Scanner[3];
        for (int i = 0; i < 3; i++) {
            scan[i] = new Scanner(lines[i]);
            scan[i].useDelimiter(",");
        }

        while (scan[0].hasNext()){
            firstNameM.add(scan[0].next());
        }
        while (scan[1].hasNext()){
            firstNameF.add(scan[1].next());
        }
        while (scan[2].hasNext()){
            name.add(scan[2].next());
        }

        Random rand = new Random();
        int randFNM;
        int randFNF;
        int randN;
        int age;
        int bool;

        PrintWriter pw = createFile("insert.sql");
        pw.println("INSERT INTO /*                       */");
        for (int i = 0; i < n; i++) {
            randN = rand.nextInt(name.size());
            age = rand.nextInt(19) + 17;
            bool = rand.nextInt(2);
            if (bool == 0){
                randFNM = rand.nextInt(firstNameM.size());
                pw.println('(' + firstNameM.get(randFNM) + ',' + name.get(randN) + ',' + "homme" + ',' + age + ')');
            } else {
                randFNF = rand.nextInt(firstNameF.size());
                pw.println('(' + firstNameF.get(randFNF) + ',' + name.get(randN) + ',' + "femme" + ',' + age + ')');
            }
        }
        pw.print(';');
        pw.close();
    }

    public static void main(String[] args){
        RandomiseName rn = new RandomiseName();
        try {
            rn.generate(args[0], Integer.parseInt(args[1]));
        } catch (ArrayIndexOutOfBoundsException e){
            System.out.println("\n      Please enter correct parameters !");
            System.out.println("      Use : $java RandomiseName [Path of the file with the name] [Number of name to generate]");
        } finally {
            System.out.println("      Done.\n");
        }
    }
}
