package ru.sogaz.esb.adapter.documentum.interfaces;

import ru.sogaz.esb.adapter.documentum.model.Document;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
@Path("/dctm-rest72")
public interface IDocumentum {

    @Path("/repositories/orclord/folders/0c000001816ffaba/")
    @Consumes("application/vnd.emc.documentum+json")
    @POST
    public Document create(Document document);


}
