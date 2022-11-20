# (0.5 Poena) Biblioteka može da vrati dvodimenzioni niz sa vrednostima tabele
#
# (0.5 Poena) Moguće je pristupati redu preko t.row(1), i pristup njegovim elementima po sintaksi niza.
#
# (0.5 Poena) Mora biti implementiran Enumerable modul(each funkcija), gde se vraćaju sve ćelije unutar tabele, sa leva na desno.
#
# (1.0 Poena) [ ] sintaksa mora da bude obogaćena tako da je moguće pristupati određenim vrednostima.
#   Biblioteka vraća celu kolonu kada se napravi upit t[“Prva Kolona”]
#   Biblioteka omogućava pristup vrednostima unutar kolone po sledećoj sintaksi t[“Prva Kolona”][1] za pristup drugom elementu te kolone
#   Biblioteka omogućava podešavanje vrednosti unutar ćelije po sledećoj sintaksi t[“Prva Kolona”][1]= 2556
#
# (5.0 Poena) Biblioteka omogućava direktni pristup kolonama, preko istoimenih metoda.
#   t.prvaKolona, t.drugaKolona, t.trecaKolona
#     Subtotal/Average  neke kolone se može sračunati preko sledećih sintaksi t.prvaKolona.sum i t.prvaKolona.avg
#   Iz svake kolone može da se izvuče pojedinačni red na osnovu vrednosti jedne od ćelija. (smatraćemo da ta ćelija jedinstveno identifikuje taj red)
#     Primer sintakse: t.indeks.rn2310, ovaj kod će vratiti red studenta čiji je indeks rn2310
#   Kolona mora da podržava funkcije kao što su map, select,reduce. Naprimer: t.prvaKolona.map { |cell| cell+=1 }
#
# (0.5 Poena) Biblioteka prepoznaje ukoliko postoji na bilo koji način ključna reč total ili subtotal unutar sheet-a, i ignoriše taj red
#
# (0.5 Poena) Moguce je sabiranje dve tabele, sve dok su im headeri isti.
#   Npr t1+t2, gde svaka predstavlja, tabelu unutar jednog od worksheet-ova.
#   Rezultat će vratiti novu tabelu gde su redovi(bez headera) t2 dodati unutar t1. (SQL UNION operacija)
#
# (0.5 Poena) Moguce je oduzimanje dve tabele, sve dok su im headeri isti.
#   Npr t1-t2, gde svaka predstavlja reprezentaciju jednog od worksheet-ova.
#   Rezultat će vratiti novu tabelu gde su svi redovi iz t2 uklonjeni iz t1, ukoliko su identicni.
#
# (0.5 Poena) Biblioteka prepoznaje prazne redove, koji mogu biti ubačeni izgleda radi




require "google_drive"      # google drive biblioteka

session = GoogleDrive::Session.from_config('cfg.json')      # uzimanje podataka iz config file copy paste
ws = session.spreadsheet_by_key('17deYQGv_Q6GXMPdQW9NVcVMFpQC4Mzk8SQ4lyUDfFJA')     # postoji array worksheets koji sadrzi sve sheets iz workspace

class OurTable # potrebna nam je neka nasa klasa tabele u kojoj cemo cuvati vrednosti iz worksheet

  include Enumerable # moramo da include enumerable po zahtevu

  def initialize(worksheet)   # prosledjujemo worksheet u kojoj se nalazi tabela da bi napravili nasu tabelu
    @worksheet = sheet        # promenljiva za worksheet
    @tabela = []              # nasa tabela
    @imenaKolona = []         # header (imena kolona) ne trebaju da se nalaze unutar tabele vec kao poseban niz
    @indeksi = {}             # hash mapa gde cuvamo sve nase kolone iz klase OurColumn
    @pocetni_red = nil        # pocetni red tabele u worksheet posto tabela ne mora da se nadje u gornjem densom uglu
    @pocetna_kolona = nil     # pocetna kolona tabele u worksheet posto tabela ne mora da se nadje u gornjem densom uglu
    @prazni_redovi = []       # prazni redovi koji se nalaze izmedju headera i tabele ili redovi u kojima se nalazi subtotal cuvamo njihove indekse da bi vratili nazad u tabelu
    @duzina_u_redovima        # duzina nase tabele u reovima
    @sirina_u_kolonama        # sirina nase tabele u kolonama
  end

  attr_accessor               #treba dodeliti sve atribute u attr_accesor jer ce nam vecina trebati

  def kreirajTabeluIzWorksheeta(worksheet)
    # prolazimo kroz worksheet po redovima i kolonama od 1..worksheet.num_rows 1..worksheet.num_cols
    # sve dok je pocetni red ili pocetna kolona nil proveravamo unos celije
    # ukoliko je unos celije '' prazan string a pocetni red ili kolona su nil postavljamo
    # pocetni red i kolonu na trenutn i odmah mozemo izracunati duzinu nase tabele
  end

  def izvuciImenaKolonaIzWorksheeta(worksheet)
    # prolazimo kroz worksheet po kolonama (1..worksheet.num_cols.each do) i u imena kolona pakujemo
    # sve spojeno malim slovima sto se nalazi u celiji worksheet[pocetni_red,data_kolona]
  end

  def sveSpojenoSveMalaSlova(string)
    # koristimo split po ' ' razmaku prolazimo kroz taj niz i svaki element downcase! i spajamo u jedan string
  end

  def popuniTabelu(worksheet)
    # prolazimo kroz redove i svaki put kad dodjemo do novog reda pravimo pomocni prazan niz
    # prolazimo po kolonama i ukoliko je neki element te kolone prazan string '' string 'total' ili string 'subtotal'
    # upisujemo indeks tog reda u niz prazni redovi i i breakujemo prolazak kroz taj red
    # ukoliko nije ubacujemo sve vrednosti u pomocni niz i taj niz pakujemo u tabelu sa tabela << niz
  end

  def uzmiIndekse
    # prolazimo kroz nasu tabelu po kolonama od 0..duzina_u_kolonama-1
    # indeks mapu smestamo element iz niza imena kolona sa indeksom kao i nasa kolona dok prolazimo
    # kao vrednost pravimo novu instancu klase OurColumn i prosledjujemo joj self i col(kolona)
  end

  def row(broj)
    # iz tabele uzimamo vrednost na broju broj po principu tabela[broj]
  end

  def col(broj)
    # transpose tabelu i uzimamo vrednost na tabela.transpose[broj]
  end

  def each
    # prolazimo kroz tabelu po redovima i kolonama od i yield tabela[red][kolona]
  end

  def [](kolona)
    # pozivamo sveSpojenoSveMalaSlova i prosledjujemo ime kolone koje smo zadali u []
    # iz hash mape indeksi vracamo vrednost za tako dobijeni string
  end

  def method_missing(symbol, *args)
    # mozemo da se oslonimo na gornju metodu [] i da je pozovemo nad self sa symbol kao argumentom
  end

  def +(drugaTabela)
    # proveravamo jesu li tabele iste ukoliko su iste uzimamo red iz druge tabele
    # i saljemo ga na worksheet na red koji je za jedan indeks veci od trenutnog broja redova u worksheet
    # i redom saljemo elemente iz kolone
    # pozivamo worksheet.save i worksheet.reload
  end

  def -(drugaTabela)
    # proveravamo jesu li tabele iste i ukoliko jesu proveravamo svaki red u nasoj prvoj tabeli
    # i svaki red iz druge tabele i ukoliko su isti iz preve tabele na tom indeksu stavljamo prazan string
    # umesto vrednosti koji su bili u tabeli
    # pozivamo worksheet.save i worksheet.reload
  end

  def jesuIste?(drugaTabela)
    # proveravamo je li druga tabela instanca OurTable i ukoliko jeste proveravamo da li su imenaKolona ista
    # ukoliko su oba uslova tacna vracamo true ukoliko nisu false
  end

  def posaljiKolonuNaServer(kolona,indeks)
    # saljemo kolonu na server tako sto prolazimo kroz nas workspace
    # ukoliko u nisu prazni redovi se nalazi neki broj koji je jednak trenutnom redu u kom se nalazimo
    # mi trenutni red povecavamo dodatni put da bi preskocili prazan red
    # zatim idemo redom kroz kolonu i upisujemo na server na indeksu na tom redu
    # pozivamo worksheet.save i worksheet.reload
  end
end

class OurColumn # potrebna nam je klasa moja kolona koju cemo vracati iz tabele radi lakseg definisanja metoda

  def initialize(tabela,kolona) # prima OurTable i niz u konstruktoru
    @mojaTabela                 # instanca OurTable da bi mogli da imamo referencu na tabelu iz koje je kolona
    @kolona                     # niz koji smo prosledili koji je ta kolona
  end

  attr_accessor # dodajemo oba polja

  def uNizBrojeva(kolona)
    # prolazimo kroz elemente kolone i preko to_i metode ih pretvaramo u int i vracamo novi niz int
    # potrebno za dalje koriscenje
  end

  def sum(init = nil)
    # kolonu prebacujem o uNizBrojeva i nad tim nizom pozivamo .sum
  end

  def method_missing(symbol, *args, &block)
    # symbol pretvaramo u string i downcase i ukoliko nije nil provravamo da li je
    # reduce ukoliko je recude pretvaramo kolonu uNizBrojeva i nad njim radimo reduce sa prvim elemoontom argumenata pretvorenim to_sym
    # select ukoliko je select pretvaramo kolonu u niz brojeva i nad njim pozivamo select i prosledjujemo &block
    # map pretvaramo rezultat u niz brojeva i nad njim pozivamo map i prosledjujemo &block i saljemo na server kolonu
    # avg pretvaramo u niz brojeva i pozivamo 1.0*taj niz.sum / taj niz.size
    # ukoliko nije nista od gore navedenog iz kolone nalazimo indeks elementa sa ovom vrednoscu i vracamo
    # red iz tabele sa tim indeksom
  end

  def promeniKolonuUTabeli(kolona,redni_broj_kolone)
    # saljemo tabelu na server i ponovo pozivamo popunjavanje
  end

  def nadjiIndeks
    # prolazimo kroz mapu indeksa i proveravamo da li je vrednost ista kao self
    # ukoliko jeste vracamo redni broj tog elementa
  end

  def [](vrednost)
    # definisano kao element na poziciji vrednost u koloni
  end

  def[]=(indeks,vrednost)
    # menjamo vrednost na indeksu u koloni u menjam o kolonu na ovom indeksu
  end

  def posaljiKolonuNaServer(kolona,indeks)
    # saljemo kolonu na server tako sto prolazimo kroz nas workspace
    # ukoliko u nisu prazni redovi se nalazi neki broj koji je jednak trenutnom redu u kom se nalazimo
    # mi trenutni red povecavamo dodatni put da bi preskocili prazan red
    # zatim idemo redom kroz kolonu i upisujemo na server na indeksu na tom redu
    # pozivamo worksheet.save i worksheet.reload
  end

end