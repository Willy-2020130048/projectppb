import 'package:flutter/material.dart';
import 'package:projectppb/Database/repository.dart';
import 'package:projectppb/Models/produks.dart';

class ListProduk extends StatefulWidget {
  const ListProduk({super.key});

  @override
  State<ListProduk> createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  RepositoryProduk repo = RepositoryProduk();
  List<Produk> _list = [];

  @override
  Widget build(BuildContext context) {
    _list = repo.list;
    return Column(
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              color: const Color(0xFFDC0000),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("Baterai", style: TextStyle(color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("Baterai", style: TextStyle(color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("Baterai", style: TextStyle(color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("Baterai", style: TextStyle(color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("Baterai", style: TextStyle(color: Colors.black),)),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
                child: Card(
                          semanticContainer: true,
                          margin: const EdgeInsets.all(5),
                          shadowColor: Colors.blueGrey,
                          elevation: 4,
                          child: Container(
                                height: 80,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      "asd",
                                    ),
                                  ),
                                ),
                              ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: _list.length,
                    itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 200,
                        child: Card(
                          semanticContainer: true,
                          margin: const EdgeInsets.all(5),
                          shadowColor: Colors.blueGrey,
                          elevation: 4,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      _list[index].gambar,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _list[index].nama,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _list[index].harga.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
      );
  }
}