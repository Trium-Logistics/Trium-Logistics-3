SELECT * FROM trium.rotas;

select fabricas.`NO_MUN` as 'Municipio de Origem', clientes.mun as 'Municipio Destino',
fabricas.`SG_UF` as 'Estado', rotas.`ï»¿Emissao`, rotas.`Entrega`, rotas.Veiculo, 
rotas.`pallets`, rotas.`Transp`, rotas.`Dist` as 'Distância em KM', rotas.`Incoterm`,
rotas.`Frete` as 'Frete', rotas.chave
from trium.clientes, trium.fabricas, trium.rotas

where clientes.`CO.Cliente` = rotas.`Cliente` and fabricas.`CO.Fabrica` = rotas.`Fabrica`
and Incoterm = 'FOB' AND Frete <> 0
ORDER BY chave DESC;

SET SQL_SAFE_UPDATES = 0;


UPDATE rotas
SET Incoterm = 'CIF'
WHERE Incoterm = 'FOB' AND Frete > 0;
---------------------------------------------------

select fabricas.`NO_MUN` as 'Municipio de Origem', clientes.mun as 'Municipio Destino',
fabricas.`SG_UF` as 'Estado', rotas.`ï»¿Emissao`, rotas.`Entrega`, rotas.Veiculo, 
rotas.`pallets`, rotas.`Transp`, rotas.`Dist` as 'Distância em KM', rotas.`Incoterm`,
rotas.`Frete` as 'Frete'
from trium.clientes, trium.fabricas, trium.rotas

where clientes.`CO.Cliente` = rotas.`Cliente` and fabricas.`CO.Fabrica` = rotas.`Fabrica`

AND `Veiculo` = 'P12' 
AND `Transp` = 3600;

Update trium.rotas
set Veiculo = 'P24'
where Veiculo = 'P12' AND Transp > 2400;

------------------------------------------------------------

select fabricas.`NO_MUN` as 'Municipio de Origem', clientes.mun as 'Municipio Destino',
fabricas.`SG_UF` as 'Estado', rotas.`ï»¿Emissao`, rotas.`Entrega`, rotas.Veiculo, 
rotas.`pallets`, rotas.`Transp`, rotas.`Dist` as 'Distância em KM', rotas.`Incoterm`,
rotas.`Frete` as 'Frete', rotas.chave
from trium.clientes, trium.fabricas, trium.rotas

where clientes.`CO.Cliente` = rotas.`Cliente` and fabricas.`CO.Fabrica` = rotas.`Fabrica`
and
CAST(CONCAT(SUBSTRING(`Entrega`, 7, 2), '-', SUBSTRING(`Entrega`, 4, 2), '-', SUBSTRING(`Entrega`, 1, 2)) AS DATE) <
CAST(CONCAT(SUBSTRING(`ï»¿Emissao`, 7, 2), '-', SUBSTRING(`ï»¿Emissao`, 4, 2), '-', SUBSTRING(`ï»¿Emissao`, 1, 2)) AS DATE);

--------------------------------------------------------

DELETE FROM rotas
WHERE chave IN ('59075', '59180', '59183', '59210', '59282');


