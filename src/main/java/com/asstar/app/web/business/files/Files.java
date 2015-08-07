package com.asstar.app.web.business.files;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;

import com.asstar.app.common.jpa.JpaEntity;
import com.sun.org.apache.xml.internal.security.utils.Base64;

@Entity(name = "b_files")
public class Files extends JpaEntity {

	public String name;
	@Lob
	@Basic(fetch = FetchType.LAZY)
	public byte[] file;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFile() {
		return Base64.encode(file);
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

}
