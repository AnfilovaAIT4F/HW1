SELECT "ID", count("BID"='0'AND "BID"=NULL), count("BID"<>'0'), count("BID")
FROM public.quotes_task
WHerE "BID"<>'0'
GROUP BY "ID"
;

--Здесь норм считает
SELECT "ID", 1-count("BID"='0' OR "BID"=NULL)/count("ID") as nunratio
FROM public.quotes_task
	GROUP BY "ID";

 SELECT  distinct "CPN_DATE", "ID", "BID"
 FROM public.quotes_task
 GROUP BY 
  "CPN_DATE";
---Более или менее полноценная попытка это посчитать
SELECT public.listing_task."IssuerName", public.listing_task."ISIN", abc.nunratio
FROM public.listing_task
INNER JOIN (SELECT "ID", 1-count("BID"='0' OR "BID"=NULL)/count("ID") as nunratio
---количество нулнвых наблюдений минус общее число наблюдений сгруппированное по айди
FROM public.quotes_task
GROUP BY "ID")  as abc  
 ON listing_task."ID"=abc."ID"
WHERE "Platform"='Московская Биржа' AND "Section"='Основной' AND ("nunratio")>0.1;
---еще бы кнч по датам отсортировать, но это не работает ( я правда старалась сделать это :-))))
SELECT  distinct "CPN_DATE", "ID", "BID"
 FROM public.quotes_task
 GROUP BY "ID"
 GROUP BY "CPN_DATE";

