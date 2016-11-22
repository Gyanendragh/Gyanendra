package org.coop.sidc.repositories;

import org.coop.sidc.domain.Staff;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface  StaffRepository extends  CrudRepository<Staff, Long>{
	

}