      /if defined(OBJDS_H)
      /eof
      /endif
      /define OBJDS_H

        dcl-pr QUSLOBJ extpgm('QUSLOBJ');
               QualUsrSpc      char(20) const;
               FormatName      char(8)  const;
               ObjLibName      char(20) const;
               ObjType         char(10) const;
               QUsec           likeds(QUsec_t);
        end-pr;

       dcl-pr QLIDLTO  extpgm('QLIDLTO');
              ObjLibName      char(20) const;
              ObjType         char(10) const;
              AuxStgPool      char(10) const;
              RmvMsg          char(1)  const;
              QUsec           likeds(QUsec_t);
       end-pr;        

        dcl-pr QDBLDBR extpgm('QDBLDBR');
               QualUsrSpc      char(20) const;
               FormatName      char(8)  const;
               QualFilName     char(20) const;
               Member          char(10) const;
               RecordFmt       char(10) const;
               QUsec           likeds(QUsec_t);
        end-pr;

        dcl-pr RSTUSR extpgm('RSTUSR');
               peFilt   char(10) const;
               peLusr   likeds(listaUsuarios_t) dim(500);
               peCant   int(10);
        end-pr;

        dcl-ds OBJL0100 qualified based(p_LstEnt);
               ObjNamUsed char(10);
               ObjLibUsed char(10);
               ObjTypUsed char(10);
        end-ds;

        dcl-ds OBJL0200 qualified based(p_LstEnt);
               ObjNamUsed char(10);
               ObjLibUsed char(10);
               ObjTypUsed char(10);
               InfoStatus char(1);
               ExtObjAttr char(10);
               TextDescri char(50);
               UsrDefAttr char(10);
               Reserved   char(7);
        end-ds;

        dcl-ds DBRL0100 qualified based(p_LstEnt);
               FilNamUsed char(10);
               FilLibUsed char(10);
               DepFilName char(10);
               DepLibName char(10);
               DepType    char(1);
               Reserved   char(3);
               JoinRefNbr int(10);
               ConstLib   char(10);
               ConstLen   int(10);
               ConstNam   char(258);
        end-ds;

        dcl-ds listaUsuarios_t qualified template;
               nombre       char(10);
               descripcion  char(50);
        end-ds;

        dcl-ds programas_t qualified template;
               s packed(2:0);
               p char(10); 
        end-ds;
       