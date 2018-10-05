package com.cufflink.news;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class ReCmtController {
      @Autowired private ReboardDao dao;
      @RequestMapping(value="/re/listCmt", method={RequestMethod.GET, RequestMethod.POST})
      public String listCmt(String no, ModelMap map) {
            List listCmt = dao.getListCmt(no);
            map.put("listCmt", listCmt);
            return "reboard/listCmt";

      }

      @RequestMapping(value="/re/createCmt", method={RequestMethod.GET, RequestMethod.POST})
      public void createCmt(ReboardDto dto, Writer writer) throws IOException {
            dao.createCmt(dto);
            writer.write("end");
      }
      @RequestMapping(value="/re/deleteCmt", method={RequestMethod.GET, RequestMethod.POST})
      public void deleteCmt(ReboardDto dto, Writer writer) throws IOException {
            dao.deleteCmt(dto);
            writer.write("end");

      }

}

