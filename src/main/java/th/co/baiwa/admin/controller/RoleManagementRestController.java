package th.co.baiwa.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import th.co.baiwa.admin.entity.Role;
import th.co.baiwa.admin.service.RoleService;

@RestController
@RequestMapping(value = "/admin/role")
public class RoleManagementRestController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/list.json", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<Role> listGET() {
		logger.info("list method");
		
		List<Role> roleList = null;
		
		return roleList;
	}
	
	@RequestMapping(value = "/list.json", method = RequestMethod.POST, headers = "Accept=application/json")
	public List<Role> list() {
		logger.info("list method");
		
		List<Role> roleList = null;
		
		return roleList;
	}
	
	@RequestMapping(value = "/update.json", method = RequestMethod.POST, headers = "Accept=application/json")
	public Role update(@RequestBody Role role) {
		logger.info("update method");
		
//		BuckWaRole role2 = request.getParameter("role");
		
		//role.setRoleDesc(role.getRoleDesc() + "edit");
		
		System.out.println(role.getRoleCode());
//		System.out.println(role.getRoleName());
//		System.out.println(role.getRoleDesc());
		
		return role;
	}
	
}
