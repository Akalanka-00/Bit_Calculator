class Information {
  String title;
  String discription;
  

  Information({
    this.title,
    this.discription,
  });

  static List<Information> information = [
    Information(
      title: "What is the bit and byte?",
      discription: "bits and bytes are both units of data",
    ),
    Information(
      title: "Different of the bits and Bytes",
      discription: "One byte is equivalent to eight bits. \nA bit is considered to be the smallest unit of data measurement."
    ),
    Information(
      title: "KB, kb, MB, mb and etc",
      discription: "They are the units of data. "
    ),
    Information(
      title: "Representing this meassurements",
      discription: "KiloBit(Kb)   KiloByte(KB)  \nMegaBit(Mb)   MegaByte(MB)  \nGigabit(Gb)   GigaByte(GB)"
    ),
    Information(
      title: "Difference of Byte and KiloByte",
      discription: "One KiloByte equal to 1024 Bytes and 1024 KB equal to 1GB",
    ),
    Information(
      title: "Mbs and MBs",
      discription: "This is the units of data transerfering. \n Mbs - Megabit per second \n MBs - MegaByte per second "
    ),
  ];
}
