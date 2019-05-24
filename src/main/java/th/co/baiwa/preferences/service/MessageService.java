package th.co.baiwa.preferences.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.EditDataTableRespone;
import th.co.baiwa.common.constant.CommonConstants.EditDataTableAction;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.baiwa.preferences.dao.MessageDao;
import th.co.baiwa.preferences.entity.Message;

@Service("messageService")
public class MessageService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MessageDao messageDao;

	public DataTableAjax<Message> getMessageAll(Integer start, Integer length) {

		DataTableAjax<Message> dataTableAjax = new DataTableAjax<>();
		Long count = messageDao.countgetMessageAll();
		List<Message> data = messageDao.getMessageAll(start, length);
		dataTableAjax.setRecordsTotal(count.intValue());
		dataTableAjax.setRecordsFiltered(count.intValue());
		dataTableAjax.setData(data);
		return dataTableAjax;
	}

	public void getMessageAction(EditDataTableRespone<Message> editDataTable) {
		logger.info("getMessageAction");

		String user = UserLoginUtils.getCurrentUser().getUsername();
		Date createbyDate = new Date();
		if (EditDataTableAction.CREATE.equals(editDataTable.getAction())) {
			for (Message message : editDataTable.getData()) {
//				message.setCreateBy(user);
//				message.setCreateDate(createbyDate);
				//messageDao.persist(message);
			}
		} else if (EditDataTableAction.EDIT.equals(editDataTable.getAction())) {
			for (Message message : editDataTable.getData()) {
//				message.setUpdatedBy(user);
//				message.setUpdatedDate(createbyDate);
				//messageDao.merge(message);
			}
		} else if (EditDataTableAction.REMOVE.equals(editDataTable.getAction())) {
			for (Message message : editDataTable.getData()) {
				//messageDao.delete(message.getMessageId());
			}
		}

	}

}
