# paslaugos install
1. sukurti DB pavadinimu yii2_paslaugos
2. parsisiuntus failus padaryti [php init]
4. padaryti [composer update]
5. atlikti DB lentų migraciją (jei nepavyks, naudoti backup.sql)
6. užkelti sql [Install info/duomenys.sql]
7. Jei mes klaida kartik-v/yii2-grid, tai ištrinti ir vel įrašyti
7.1 php composer.phar require kartik-v/yii2-grid "@dev" ir php composer.phar update

--------------------------------------------------------------------

1. Paslaugos
Vartotojas turintis teises gali sukurti paslaugą ir prie jos papildomai pridėti papildomas paslaugas. PVZ:
Paslauga: Sporto klubas
Papildomos paslaugos: Treniruotė su treneriu, plaukimo paslaugos ir kt...
2. Visos paslaugos
Vartotojas turintis teises gali matyti visas sukurtas paslaugas.
3. Registracija
Vartotojas gali registruotis į sistemą ir matyti frontend ir backend.
4. Vartotojai
Visus vartotojus galima pamatyti backend'e [backend/web/settings/user]
Paspaudus "view" ikoną galima priskirti Teises į puslapius
Paspaudus "update" ikoną galima išjungti ir įjungti vartotoją bei redaguoti vardą ir pavardę
5. Prisijungimai
Admin: demo, password: demodemo
