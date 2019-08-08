FasdUAS 1.101.10   ��   ��    k             l     ��  ��    > 8 Easy File/Folder Encryption and Decryption with openssl     � 	 	 p   E a s y   F i l e / F o l d e r   E n c r y p t i o n   a n d   D e c r y p t i o n   w i t h   o p e n s s l   
  
 l     ��  ��    ; 5 Written by: Aaron Lichtman <aaronlichtman@gmail.com>     �   j   W r i t t e n   b y :   A a r o n   L i c h t m a n   < a a r o n l i c h t m a n @ g m a i l . c o m >      l     ��������  ��  ��        l     ��  ��     #################     �   " # # # # # # # # # # # # # # # # #      l     ��  ��      Helper Functions     �   "   H e l p e r   F u n c t i o n s      l     ��  ��     #################     �   " # # # # # # # # # # # # # # # # #     !   l     ��������  ��  ��   !  " # " l     �� $ %��   $ � � Stolen from: https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ManipulateText.html    % � & &*   S t o l e n   f r o m :   h t t p s : / / d e v e l o p e r . a p p l e . c o m / l i b r a r y / a r c h i v e / d o c u m e n t a t i o n / L a n g u a g e s U t i l i t i e s / C o n c e p t u a l / M a c A u t o m a t i o n S c r i p t i n g G u i d e / M a n i p u l a t e T e x t . h t m l #  ' ( ' i      ) * ) I      �� +���� ,0 findandreplaceintext findAndReplaceInText +  , - , o      ���� 0 thetext theText -  . / . o      ���� "0 thesearchstring theSearchString /  0�� 0 o      ���� ,0 thereplacementstring theReplacementString��  ��   * k       1 1  2 3 2 r      4 5 4 o     ���� "0 thesearchstring theSearchString 5 n      6 7 6 1    ��
�� 
txdl 7 1    ��
�� 
ascr 3  8 9 8 r     : ; : n    	 < = < 2    	��
�� 
citm = o    ���� 0 thetext theText ; o      ���� 0 thetextitems theTextItems 9  > ? > r     @ A @ o    ���� ,0 thereplacementstring theReplacementString A n      B C B 1    ��
�� 
txdl C 1    ��
�� 
ascr ?  D E D r     F G F c     H I H o    ���� 0 thetextitems theTextItems I m    ��
�� 
TEXT G o      ���� 0 thetext theText E  J K J r     L M L m     N N � O O   M n      P Q P 1    ��
�� 
txdl Q 1    ��
�� 
ascr K  R�� R L      S S o    ���� 0 thetext theText��   (  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X  #######    Y � Z Z  # # # # # # # W  [ \ [ l     �� ] ^��   ]  
 Constants    ^ � _ _    C o n s t a n t s \  ` a ` l     �� b c��   b  #######    c � d d  # # # # # # # a  e f e l     ��������  ��  ��   f  g h g l     i���� i r      j k j m      l l � m m  . e n c r y p t e d k o      ���� (0 encryptedextension encryptedExtension��  ��   h  n o n l     ��������  ��  ��   o  p q p l     �� r s��   r 
 ####    s � t t  # # # # q  u v u l     �� w x��   w   Main    x � y y 
   M a i n v  z { z l     �� | }��   | 
 ####    } � ~ ~  # # # # {   �  l     ��������  ��  ��   �  � � � l     �� � ���   � ] W TODO: Make sure openssl is installed, and if it isn't, spit out a user friendly error.    � � � � �   T O D O :   M a k e   s u r e   o p e n s s l   i s   i n s t a l l e d ,   a n d   i f   i t   i s n ' t ,   s p i t   o u t   a   u s e r   f r i e n d l y   e r r o r . �  � � � l     ��������  ��  ��   �  � � � l    ����� � O    � � � r     � � � 1    ��
�� 
sele � o      ���� 0 selected_items   � m     � ��                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  � � � l  � � � � � X   � ��� � � k   � � �  � � � r    & � � � n    $ � � � 1   " $��
�� 
psxp � l   " ����� � c    " � � � o     ���� 0 itemref itemRef � m     !��
�� 
TEXT��  ��   � o      ���� 0 filepath filePath �  � � � I  ' ,�� ���
�� .ascrcmnt****      � **** � o   ' (���� 0 filepath filePath��   �  � � � l  - -��������  ��  ��   �  � � � r   - 8 � � � I  - 6�� ���
�� .sysoexecTEXT���     TEXT � b   - 2 � � � b   - 0 � � � m   - . � � � � � 
 f i l e   � o   . /���� 0 filepath filePath � m   0 1 � � � � � $   |   s e d   ' s / ^ . * :   / / '��   � o      ���� 0 filetype fileType �  � � � I  9 B�� ���
�� .sysodlogaskr        TEXT � b   9 > � � � m   9 < � � � � �  F i l e T y p e :   � o   < =���� 0 filetype fileType��   �  � � � l  C C��������  ��  ��   �  � � � l  C C�� � ���   � 4 . If the file is already encrypted, decrypt it.    � � � � \   I f   t h e   f i l e   i s   a l r e a d y   e n c r y p t e d ,   d e c r y p t   i t . �  � � � Z   C� � ��� � � =  C H � � � o   C D���� 0 filetype fileType � m   D G � � � � � N o p e n s s l   e n c ' d   d a t a   w i t h   s a l t e d   p a s s w o r d � k   K � � �  � � � r   K b � � � l  K ^ ����� � n   K ^ � � � 1   Z ^��
�� 
ttxt � l  K Z ����� � I  K Z�� � �
�� .sysodlogaskr        TEXT � b   K P � � � m   K N � � � � � 0 E n t e r   t h e   p a s s w o r d   f o r :   � o   N O���� 0 filepath filePath � �� ���
�� 
dtxt � m   S V � � � � �  ��  ��  ��  ��  ��   � o      ���� 0 decryptionkey decryptionKey �  � � � I  c h�� ���
�� .sysodlogaskr        TEXT � o   c d���� 0 filepath filePath��   �  � � � r   i w � � � I   i s�� ����� ,0 findandreplaceintext findAndReplaceInText �  � � � o   j k���� 0 filepath filePath �  � � � o   k l���� (0 encryptedextension encryptedExtension �  ��� � m   l o � � � � �  ��  ��   � o      ���� *0 unencryptedfilepath unencryptedFilePath �  � � � I  x ��� ���
�� .sysoexecTEXT���     TEXT � b   x � � � � b   x � � � � b   x � � � � b   x � � � � b   x } � � � m   x { � � � � � L o p e n s s l   e n c   - d   - a e s - 2 5 6 - c b c   - s a l t   - i n   � o   { |���� 0 filepath filePath � m   } � � � � � �    - o u t   � o   � ����� *0 unencryptedfilepath unencryptedFilePath � m   � � � � � � �    - k   � o   � ����� 0 decryptionkey decryptionKey��   �  ��� � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � �   m   � � �  D e c r y p t e d :   o   � ����� *0 unencryptedfilepath unencryptedFilePath��  ��  ��   � k   ��  l  � �����     Encryption routine    �		 &   E n c r y p t i o n   r o u t i n e 

 r   � � o   � ����� 0 filepath filePath o      ���� 0 
sourcefile 
sourceFile  l  � ���������  ��  ��    l  � �����   @ : If the filepath is a folder, compress it into a zip file.    � t   I f   t h e   f i l e p a t h   i s   a   f o l d e r ,   c o m p r e s s   i t   i n t o   a   z i p   f i l e .  Z   ��� =  � � n   � � 1   � ���
�� 
kind l  � ���� I  � ��~�}
�~ .sysonfo4asfe        file o   � ��|�| 0 filepath filePath�}  ��  �   m   � �   �!!  f o l d e r k   �"" #$# I  � ��{%�z
�{ .sysodlogaskr        TEXT% b   � �&'& o   � ��y�y 0 filepath filePath' m   � �(( �))    i s   a   f o l d e r .�z  $ *+* r   � �,-, n   � �./. 7 � ��x01
�x 
ctxt0 m   � ��w�w 1 m   � ��v�v��/ o   � ��u�u 0 filepath filePath- o      �t�t 0 dirpath dirPath+ 232 r   � �454 b   � �676 o   � ��s�s 0 dirpath dirPath7 m   � �88 �99  . z i p5 o      �r�r 0 
sourcefile 
sourceFile3 :;: I  � ��q<�p
�q .sysoexecTEXT���     TEXT< b   � �=>= b   � �?@? b   � �ABA m   � �CC �DD  z i p   - r  B n   � �EFE 1   � ��o
�o 
strqF l  � �G�n�mG o   � ��l�l 0 
sourcefile 
sourceFile�n  �m  @ m   � �HH �II   > n   � �JKJ 1   � ��k
�k 
strqK l  � �L�j�iL o   � ��h�h 0 dirpath dirPath�j  �i  �p  ; M�gM I  ��fN�e
�f .sysodlogaskr        TEXTN b   �OPO m   � �QQ �RR  C r e a t e d :  P o   ��d�d 0 
sourcefile 
sourceFile�e  �g  ��   I 
�cS�b
�c .sysodlogaskr        TEXTS b  
TUT o  
�a�a 0 
sourcefile 
sourceFileU m  VV �WW    i s   a   f i l e .�b   XYX l �`�_�^�`  �_  �^  Y Z[Z l �]\]�]  \ � { Test to see if the encrypted file we're about to create already exists, and warn user. https://stackoverflow.com/a/3471702   ] �^^ �   T e s t   t o   s e e   i f   t h e   e n c r y p t e d   f i l e   w e ' r e   a b o u t   t o   c r e a t e   a l r e a d y   e x i s t s ,   a n d   w a r n   u s e r .   h t t p s : / / s t a c k o v e r f l o w . c o m / a / 3 4 7 1 7 0 2[ _`_ r  aba b  cdc o  �\�\ 0 
sourcefile 
sourceFiled o  �[�[ (0 encryptedextension encryptedExtensionb o      �Z�Z &0 encryptedfilename encryptedFileName` efe r   %ghg m   !�Y
�Y boovfalsh o      �X�X 20 encryptedfileexistsflag encryptedFileExistsFlagf iji O &Bklk Z *Amn�W�Vm I *5�Uo�T
�U .coredoexnull���     obj o c  *1pqp o  *-�S�S &0 encryptedfilename encryptedFileNameq m  -0�R
�R 
psxf�T  n r  8=rsr m  89�Q
�Q boovtrues o      �P�P 20 encryptedfileexistsflag encryptedFileExistsFlag�W  �V  l m  &'tt�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  j uvu Z  CXwx�O�Nw o  CF�M�M 20 encryptedfileexistsflag encryptedFileExistsFlagx I IT�Ly�K
�L .sysodlogaskr        TEXTy b  IPz{z o  IL�J�J &0 encryptedfilename encryptedFileName{ m  LO|| �}} `   a l r e a d y   e x i s t s .   W o u l d   y o u   l i k e   t o   o v e r w r i t e   i t ?�K  �O  �N  v ~~ l YY�I�H�G�I  �H  �G   ��� r  Yr��� l Yn��F�E� n  Yn��� 1  jn�D
�D 
ttxt� l Yj��C�B� I Yj�A��
�A .sysodlogaskr        TEXT� b  Y`��� m  Y\�� ��� N E n t e r   a n   e n c r y p t i o n   p a s s w o r d   f o r   f i l e :  � o  \_�@�@ 0 
sourcefile 
sourceFile� �?��>
�? 
dtxt� m  cf�� ���  �>  �C  �B  �F  �E  � o      �=�= 0 encryptionkey encryptionKey� ��� r  s���� l s���<�;� n  s���� 1  ���:
�: 
ttxt� l s���9�8� I s��7��
�7 .sysodlogaskr        TEXT� m  sv�� ��� 4 E n t e r   t h e   p a s s w o r d   a g a i n :  � �6��5
�6 
dtxt� m  y|�� ���  �5  �9  �8  �<  �;  � o      �4�4 60 encryptionkeyconfirmation encryptionKeyConfirmation� ��� l ���3�2�1�3  �2  �1  � ��� Z  �����0�/� > ����� o  ���.�. 0 encryptionkey encryptionKey� o  ���-�- 60 encryptionkeyconfirmation encryptionKeyConfirmation� k  ���� ��� I ���,��+
�, .sysodlogaskr        TEXT� m  ���� ��� T E R R O R :   E n c r y p t i o n   p a s s w o r d s   d i d   n o t   m a t c h .�+  � ��*�  S  ���*  �0  �/  � ��� l ���)�(�'�)  �(  �'  � ��� I ���&��%
�& .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� F o p e n s s l   e n c   - a e s - 2 5 6 - c b c   - s a l t   - i n  � o  ���$�$ 0 
sourcefile 
sourceFile� m  ���� ���    - o u t  � o  ���#�# &0 encryptedfilename encryptedFileName� m  ���� ���    - k  � o  ���"�" 0 encryptionkey encryptionKey�%  � ��� I ���!�� 
�! .sysodlogaskr        TEXT� b  ����� m  ���� ���  C r e a t e d :  � o  ���� &0 encryptedfilename encryptedFileName�   � ��� l ������  �  �  � ��� l ������  � / ) Remove the zip archive if we created one   � ��� R   R e m o v e   t h e   z i p   a r c h i v e   i f   w e   c r e a t e d   o n e� ��� Z  ������� = ����� n  ����� 1  ���
� 
kind� l ������ I �����
� .sysonfo4asfe        file� o  ���� 0 filepath filePath�  �  �  � m  ���� ���  f o l d e r� k  ���� ��� I �����
� .sysodlogaskr        TEXT� b  ����� m  ���� ��� D R e m o v i n g   i n t e r m e d i a t e   z i p   f o l d e r :  � o  ���� 0 
sourcefile 
sourceFile�  � ��� I �����
� .sysoexecTEXT���     TEXT� b  ����� m  ���� ���  r m  � o  ���� 0 
sourcefile 
sourceFile�  �  �  �  � ��� l ���
�	��
  �	  �  �   � ��� l ������  �  �  �  �� 0 itemref itemRef � o    �� 0 selected_items   � 4 . it will store the last filename in selection	    � ��� \   i t   w i l l   s t o r e   t h e   l a s t   f i l e n a m e   i n   s e l e c t i o n 	 � ��� l     �� ���  �   ��  �       �������  � ������ ,0 findandreplaceintext findAndReplaceInText
�� .aevtoappnull  �   � ****� �� *���������� ,0 findandreplaceintext findAndReplaceInText�� ����� �  �������� 0 thetext theText�� "0 thesearchstring theSearchString�� ,0 thereplacementstring theReplacementString��  � ���������� 0 thetext theText�� "0 thesearchstring theSearchString�� ,0 thereplacementstring theReplacementString�� 0 thetextitems theTextItems� �������� N
�� 
ascr
�� 
txdl
�� 
citm
�� 
TEXT�� !���,FO��-E�O���,FO��&E�O���,FO�� �����������
�� .aevtoappnull  �   � ****� k    ���  g��  ���  �����  ��  ��  � ���� 0 itemref itemRef� @ l�� ������������������� � ����� ��� � ��� ����� ����� � � ������� (������8C��HQV��������|������������������ (0 encryptedextension encryptedExtension
�� 
sele�� 0 selected_items  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
TEXT
�� 
psxp�� 0 filepath filePath
�� .ascrcmnt****      � ****
�� .sysoexecTEXT���     TEXT�� 0 filetype fileType
�� .sysodlogaskr        TEXT
�� 
dtxt
�� 
ttxt�� 0 decryptionkey decryptionKey�� ,0 findandreplaceintext findAndReplaceInText�� *0 unencryptedfilepath unencryptedFilePath�� 0 
sourcefile 
sourceFile
�� .sysonfo4asfe        file
�� 
kind
�� 
ctxt������ 0 dirpath dirPath
�� 
strq�� &0 encryptedfilename encryptedFileName�� 20 encryptedfileexistsflag encryptedFileExistsFlag
�� 
psxf
�� .coredoexnull���     obj �� 0 encryptionkey encryptionKey�� 60 encryptionkeyconfirmation encryptionKeyConfirmation����E�O� *�,E�UO��[��l kh  ��&�,E�O�j O��%�%j E�Oa �%j O�a   Wa �%a a l a ,E` O�j O*��a m+ E` Oa �%a %_ %a %_ %j Oa _ %j YX�E` O�j  a !,a "  V�a #%j O�[a $\[Zk\Za %2E` &O_ &a '%E` Oa (_ a ),%a *%_ &a ),%j Oa +_ %j Y _ a ,%j O_ �%E` -OfE` .O� _ -a /&j 0 
eE` .Y hUO_ . _ -a 1%j Y hOa 2_ %a a 3l a ,E` 4Oa 5a a 6l a ,E` 7O_ 4_ 7 a 8j OY hOa 9_ %a :%_ -%a ;%_ 4%j Oa <_ -%j O�j  a !,a =  a >_ %j Oa ?_ %j Y hOPOP[OY�! ascr  ��ޭ