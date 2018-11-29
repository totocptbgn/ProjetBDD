import java.util.Random;

public class Randomnames {
    public static void main(String[] args){
        String[] prenomH = {"Jean","Madiba","Montgomery","Homer","Aang","Zuko","Eikichi","Luke","Michel","Richard","Adrian","Karim","Manuel","Benjamin","Moussa","Abdelkarim","Kevin","Frank","Toru"};
        String[] prenomF = {"Jeanne","Lena","Leta","Caroline","Coraline","Akira","Marie","Azul","Morena","Penelope","Angelina","Karima","Michaela","Annalise","Korra","Chihiro","Emilie","Sabrine","Serena"};
        String[] nom1 = {"Onizuka","Hamila","Leprevault","Staut","Felipe","Iwana","Enripsia","Salamat","Oda","Fujisawa","Cruz","Mendoza","Thompson","Moore","Cobain","Staley","Hendrix","Mercury","Armstrong","Elric","Mae","Gomez"};
        String[] nom2 = {"Haraldur","Havard","Dagda","Elrod","Eber","Sunil","Ramazi","Shyamala","Neha","Edita","Izebel","Meklat","Keala","Gulnaz","Perez","Perec","Avery","Brachma","Werner","Wagner"};
        System.out.println(nom2.length);
        int count = 0;
        while(count < 124){
            Random rand = new Random();
            int i = rand.nextInt(19);
            int age = rand.nextInt((35-17)+1)+17;
            System.out.println('('+prenomF[i]+','+nom1[i]+','+"femme"+','+age+')');
            count++;
        }
        count = 0;
        while(count < 124){
            Random rand = new Random();
            int i = rand.nextInt(19);
            int age = rand.nextInt((35-17)+1)+17;
            System.out.println('('+prenomH[i]+','+nom2[i]+','+"homme"+','+age+')');
            count++;
        }
    }
}
