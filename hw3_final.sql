--Присвоение внешних ключей

ALTER TABLE public.listing_task
ADD CONSTRAINT fr_key_3 FOREIGN KEY ("ISIN")
REFERENCES public.bond_description_task ("ISIN, RegCode, NRDCode");


ALTER TABLE public.bond_description_task
ADD CONSTRAINT fr_key_3 FOREIGN KEY ("ISIN, RegCode, NRDCode")
REFERENCES public.listing_task("ISIN");

--Задание внешнего ключа номер 1
ALTER TABLE public.quotes_task 
ADD CONSTRAINT fr_key FOREIGN KEY ("ID")
REFERENCES public.listing_task ("ID");

ALTER TABLE public.quotes_task
ADD CONSTRAINT fr_key_2 FOREIGN KEY ("ISIN")
REFERENCES public.bond_description_task ("ISIN, RegCode, NRDCode");
