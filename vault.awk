BEGIN { state = 0 }

/latest/ && state == 0 {
   gsub(/[()"]/, " ")
   line=$0

   tot = split(line, line_a)

   for (i = 0; i <= tot; i+=1)
   {
      val=line_a[i]

      if (state == 0 && val == "version-dropdown") { state = 1; continue; }

      if (state == 1 && val ~ /[0-9]+\.[0-9]/)
      { 
        print val
        state = 2
      }
   }
}
